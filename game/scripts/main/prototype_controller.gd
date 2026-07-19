extends Node3D

enum StorageModuleState {
	NOT_BUILT,
	MANUFACTURING,
	IN_INVENTORY,
	PLACEMENT_ACTIVE,
	ATTACHED,
}

@export_range(1, 100, 1) var mining_damage: int = 1
@export_flags_3d_physics var asteroid_collision_mask: int = 2
@export_flags_3d_physics var rock_pickup_collision_mask: int = 4
@export_flags_3d_physics var attachment_socket_collision_mask: int = 8
@export_range(0.05, 1.0, 0.05) var beam_duration: float = 0.18
@export var rock_pickup_scene: PackedScene
@export_range(1, 12, 1) var rock_pickup_count: int = 3
@export_range(1, 20, 1) var rock_quantity_per_pickup: int = 2
@export_range(1.0, 30.0, 0.5) var rock_pickup_lifetime: float = 14.0
@export_range(0.1, 3.0, 0.05) var rock_base_drift_speed: float = 0.75
@export_range(1, 20, 1) var storage_module_rock_cost: int = 4
@export_range(0.5, 10.0, 0.5) var manufacturing_duration: float = 3.0
@export var storage_module_scene: PackedScene

@onready var _camera: Camera3D = $CameraRig/Camera3D
@onready var _mining_origin: Marker3D = $EscapePod/MiningOrigin
@onready var _attachment_sockets: Node3D = $EscapePod/AttachmentSockets
@onready var _flyby: AsteroidFlyby = $AsteroidPath/AsteroidFlyby
@onready var _asteroid: PrototypeAsteroid = $AsteroidPath/AsteroidFlyby/Asteroid
@onready var _resource_pickups: Node3D = $ResourcePickups
@onready var _manufacturing_timer: Timer = $ManufacturingTimer
@onready var _beam: MeshInstance3D = $MiningBeam
@onready var _beam_timer: Timer = $MiningBeamTimer
@onready var _hud: PrototypeHUD = $PrototypeHUD

var _selected_asteroid: PrototypeAsteroid
var _rock_count: int = 0
var _resources_released_this_run: bool = false
var _is_resetting: bool = false
var _storage_module_state: StorageModuleState = StorageModuleState.NOT_BUILT
var _storage_module_selected: bool = false
var _attached_storage_module: Node3D


func _ready() -> void:
	_asteroid.health_changed.connect(_on_asteroid_health_changed)
	_asteroid.destroyed.connect(_on_asteroid_destroyed)
	_flyby.flyby_completed.connect(_on_flyby_completed)
	_beam_timer.timeout.connect(_on_beam_timer_timeout)
	_manufacturing_timer.timeout.connect(_on_manufacturing_timer_timeout)
	_hud.reset_requested.connect(_reset_prototype)
	_hud.manufacture_requested.connect(_on_manufacture_requested)
	_hud.storage_module_selected.connect(_on_storage_module_selected)
	_hud.attach_or_cancel_requested.connect(_on_attach_or_cancel_requested)
	_set_sockets_active(false)
	_hud.show_flyby_active()
	_hud.set_rock_count(_rock_count)
	_refresh_module_presentation()
	print("Milestone 5 prototype ready.")


func _process(_delta: float) -> void:
	if _storage_module_state != StorageModuleState.MANUFACTURING:
		return

	var timer_duration: float = _manufacturing_timer.wait_time
	var progress: float = 0.0
	if timer_duration > 0.0:
		progress = clampf(1.0 - (_manufacturing_timer.time_left / timer_duration), 0.0, 1.0)
	_hud.show_manufacturing_progress(progress)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_button: InputEventMouseButton = event as InputEventMouseButton
		if mouse_button.button_index == MOUSE_BUTTON_LEFT and mouse_button.pressed:
			_interact_at_screen_position(mouse_button.position)
			get_viewport().set_input_as_handled()
			return

	if event.is_action_pressed("fire_mining_tool"):
		if event is InputEventKey and (event as InputEventKey).echo:
			return
		_fire_mining_shot()
		get_viewport().set_input_as_handled()


func _interact_at_screen_position(screen_position: Vector2) -> void:
	if _is_resetting:
		return
	if _storage_module_state == StorageModuleState.PLACEMENT_ACTIVE:
		_interact_with_socket(screen_position)
		return

	var result: Dictionary = _raycast_areas(
		screen_position,
		asteroid_collision_mask | rock_pickup_collision_mask
	)
	if result.is_empty():
		_clear_selection()
		return

	var collider: Object = result.get("collider") as Object
	if collider is RockPickup:
		var pickup: RockPickup = collider as RockPickup
		if pickup.can_be_collected():
			pickup.collect()
		return

	if collider is PrototypeAsteroid and (collider as PrototypeAsteroid).can_be_targeted():
		_set_selected_asteroid(collider as PrototypeAsteroid)
	else:
		_clear_selection()


func _interact_with_socket(screen_position: Vector2) -> void:
	var result: Dictionary = _raycast_areas(screen_position, attachment_socket_collision_mask)
	if result.is_empty():
		return
	var collider: Object = result.get("collider") as Object
	if collider is AttachmentSocket:
		_attach_storage_module(collider as AttachmentSocket)


func _raycast_areas(screen_position: Vector2, collision_mask: int) -> Dictionary:
	var ray_origin: Vector3 = _camera.project_ray_origin(screen_position)
	var ray_end: Vector3 = ray_origin + _camera.project_ray_normal(screen_position) * 100.0
	var query := PhysicsRayQueryParameters3D.create(ray_origin, ray_end, collision_mask)
	query.collide_with_areas = true
	query.collide_with_bodies = false
	return get_world_3d().direct_space_state.intersect_ray(query)


func _set_selected_asteroid(asteroid: PrototypeAsteroid) -> void:
	if is_instance_valid(_selected_asteroid) and _selected_asteroid != asteroid:
		_selected_asteroid.set_selected(false)
	_selected_asteroid = asteroid
	_selected_asteroid.set_selected(true)
	_hud.show_selected(_selected_asteroid.current_health, _selected_asteroid.maximum_health)
	print("Asteroid selected.")


func _clear_selection() -> void:
	if is_instance_valid(_selected_asteroid):
		_selected_asteroid.set_selected(false)
	_selected_asteroid = null
	if _asteroid.is_destroyed:
		_hud.show_destroyed(_asteroid.maximum_health)
	elif _flyby.is_running:
		_hud.show_flyby_active()
	else:
		_hud.show_flyby_complete()


func _fire_mining_shot() -> void:
	if not is_instance_valid(_selected_asteroid) or not _selected_asteroid.can_be_targeted():
		return
	_show_mining_beam(_mining_origin.global_position, _selected_asteroid.global_position)
	_selected_asteroid.take_mining_damage(mining_damage)


func _show_mining_beam(start: Vector3, end: Vector3) -> void:
	var beam_mesh := ImmediateMesh.new()
	beam_mesh.surface_begin(Mesh.PRIMITIVE_LINES)
	beam_mesh.surface_add_vertex(_beam.to_local(start))
	beam_mesh.surface_add_vertex(_beam.to_local(end))
	beam_mesh.surface_end()
	_beam.mesh = beam_mesh
	_beam.visible = true
	_beam_timer.start(beam_duration)


func _release_rock_pickups() -> void:
	if _resources_released_this_run or rock_pickup_scene == null:
		return
	_resources_released_this_run = true
	var destruction_position: Vector3 = _asteroid.global_position
	var travel_direction: Vector3 = _flyby.get_travel_direction()
	var side_direction: Vector3 = travel_direction.cross(Vector3.UP).normalized()
	if side_direction.is_zero_approx():
		side_direction = Vector3.RIGHT
	var up_direction: Vector3 = side_direction.cross(travel_direction).normalized()
	for index: int in rock_pickup_count:
		var pickup_node: Node = rock_pickup_scene.instantiate()
		if pickup_node is not RockPickup:
			push_error("Configured Rock pickup scene must instantiate RockPickup.")
			pickup_node.queue_free()
			continue
		var pickup: RockPickup = pickup_node as RockPickup
		var spread_ratio: float = 0.0
		if rock_pickup_count > 1:
			spread_ratio = (float(index) / float(rock_pickup_count - 1)) * 2.0 - 1.0
		var position_offset: Vector3 = side_direction * spread_ratio * 1.3 + up_direction * (0.45 - absf(spread_ratio) * 0.15)
		var drift_direction: Vector3 = (travel_direction + side_direction * spread_ratio * 0.28 + up_direction * (0.12 - float(index) * 0.06)).normalized()
		var speed_ratio: float = 1.0
		if rock_pickup_count > 1:
			speed_ratio = 0.88 + (float(index) / float(rock_pickup_count - 1)) * 0.24
		pickup.quantity = rock_quantity_per_pickup
		pickup.lifetime_seconds = rock_pickup_lifetime
		pickup.drift_velocity = drift_direction * rock_base_drift_speed * speed_ratio
		pickup.collected.connect(_on_rock_pickup_collected)
		_resource_pickups.add_child(pickup)
		pickup.global_position = destruction_position + position_offset
	var total_yield: int = rock_pickup_count * rock_quantity_per_pickup
	print("Released %d Rock across %d pickups." % [total_yield, rock_pickup_count])


func _clear_rock_pickups() -> void:
	for child: Node in _resource_pickups.get_children():
		if child is RockPickup:
			(child as RockPickup).discard_without_collection()


func _reset_prototype() -> void:
	if _is_resetting:
		return
	_is_resetting = true
	_manufacturing_timer.stop()
	_storage_module_state = StorageModuleState.NOT_BUILT
	_storage_module_selected = false
	_set_sockets_active(false)
	if is_instance_valid(_attached_storage_module):
		_attached_storage_module.queue_free()
	_attached_storage_module = null
	_clear_selection()
	_clear_rock_pickups()
	_rock_count = 0
	_hud.set_rock_count(_rock_count)
	_resources_released_this_run = false
	_beam_timer.stop()
	_beam.visible = false
	_beam.mesh = null
	_flyby.reset_flyby()
	_hud.show_flyby_active()
	_refresh_module_presentation()
	print("Prototype reset requested.")
	call_deferred("_finish_reset")


func _finish_reset() -> void:
	_is_resetting = false


func _on_asteroid_health_changed(current_health: int, maximum_health: int) -> void:
	if _selected_asteroid == _asteroid:
		_hud.show_selected(current_health, maximum_health)


func _on_asteroid_destroyed() -> void:
	_flyby.stop_flyby()
	_selected_asteroid = null
	_hud.show_destroyed(_asteroid.maximum_health)
	_release_rock_pickups()


func _on_flyby_completed() -> void:
	_selected_asteroid = null
	_hud.show_flyby_complete()


func _on_rock_pickup_collected(quantity: int) -> void:
	if _is_resetting:
		return
	_rock_count += quantity
	_hud.set_rock_count(_rock_count)
	_refresh_module_presentation()
	print("Collected %d Rock. Inventory: %d" % [quantity, _rock_count])


func _on_manufacture_requested() -> void:
	if _is_resetting or _storage_module_state != StorageModuleState.NOT_BUILT:
		return
	if _rock_count < storage_module_rock_cost:
		_refresh_module_presentation()
		return
	_storage_module_state = StorageModuleState.MANUFACTURING
	_rock_count -= storage_module_rock_cost
	_hud.set_rock_count(_rock_count)
	_manufacturing_timer.wait_time = manufacturing_duration
	_manufacturing_timer.start()
	_refresh_module_presentation()
	print("Manufacturing Storage Module started. Spent %d Rock." % storage_module_rock_cost)


func _on_manufacturing_timer_timeout() -> void:
	if _is_resetting or _storage_module_state != StorageModuleState.MANUFACTURING:
		return
	_storage_module_state = StorageModuleState.IN_INVENTORY
	_refresh_module_presentation()
	print("Storage Module complete and available in Cargo.")


func _on_storage_module_selected() -> void:
	if _is_resetting or _storage_module_state != StorageModuleState.IN_INVENTORY:
		return
	_storage_module_selected = true
	_refresh_module_presentation()


func _on_attach_or_cancel_requested() -> void:
	if _is_resetting:
		return
	if _storage_module_state == StorageModuleState.IN_INVENTORY:
		if not _storage_module_selected:
			return
		_storage_module_state = StorageModuleState.PLACEMENT_ACTIVE
		_clear_selection()
		_set_sockets_active(true)
		_refresh_module_presentation()
		print("Storage Module placement active.")
	elif _storage_module_state == StorageModuleState.PLACEMENT_ACTIVE:
		_storage_module_state = StorageModuleState.IN_INVENTORY
		_set_sockets_active(false)
		_refresh_module_presentation()
		print("Storage Module placement cancelled.")


func _attach_storage_module(socket: AttachmentSocket) -> void:
	if _is_resetting or _storage_module_state != StorageModuleState.PLACEMENT_ACTIVE:
		return
	if storage_module_scene == null or not is_instance_valid(socket):
		push_error("Storage Module scene or attachment socket is unavailable.")
		return
	var module_node: Node = storage_module_scene.instantiate()
	if module_node is not Node3D:
		push_error("Configured Storage Module scene must instantiate Node3D.")
		module_node.queue_free()
		return

	# Leave placement before changing the scene so repeated clicks cannot attach twice.
	_storage_module_state = StorageModuleState.ATTACHED
	_storage_module_selected = false
	_set_sockets_active(false)
	_attached_storage_module = module_node as Node3D
	socket.add_child(_attached_storage_module)
	_attached_storage_module.transform = Transform3D.IDENTITY
	_refresh_module_presentation()
	print("Storage Module attached at %s socket." % socket.socket_label)


func _set_sockets_active(active: bool) -> void:
	for child: Node in _attachment_sockets.get_children():
		if child is AttachmentSocket:
			(child as AttachmentSocket).set_placement_active(active)


func _refresh_module_presentation() -> void:
	match _storage_module_state:
		StorageModuleState.NOT_BUILT:
			_hud.show_manufacturing_idle(_rock_count, storage_module_rock_cost)
			_hud.show_cargo_not_built()
		StorageModuleState.MANUFACTURING:
			var timer_duration: float = _manufacturing_timer.wait_time
			var progress: float = 0.0
			if timer_duration > 0.0:
				progress = clampf(1.0 - (_manufacturing_timer.time_left / timer_duration), 0.0, 1.0)
			_hud.show_manufacturing_progress(progress)
			_hud.show_cargo_manufacturing()
		StorageModuleState.IN_INVENTORY:
			_hud.show_module_in_cargo()
			_hud.show_cargo_module_available(_storage_module_selected)
		StorageModuleState.PLACEMENT_ACTIVE:
			_hud.show_module_placement_active()
			_hud.show_cargo_placement_active()
		StorageModuleState.ATTACHED:
			_hud.show_module_attached()
			_hud.show_cargo_attached()


func _on_beam_timer_timeout() -> void:
	_beam.visible = false
	_beam.mesh = null
