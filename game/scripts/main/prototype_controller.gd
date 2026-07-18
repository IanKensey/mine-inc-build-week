extends Node3D

enum ManufacturingState {
	IDLE,
	MANUFACTURING,
	MODULE_PENDING,
}

@export_range(1, 100, 1) var mining_damage: int = 1
@export_flags_3d_physics var asteroid_collision_mask: int = 2
@export_flags_3d_physics var rock_pickup_collision_mask: int = 4
@export_range(0.05, 1.0, 0.05) var beam_duration: float = 0.18
@export var rock_pickup_scene: PackedScene
@export_range(1, 12, 1) var rock_pickup_count: int = 3
@export_range(1, 20, 1) var rock_quantity_per_pickup: int = 2
@export_range(1.0, 30.0, 0.5) var rock_pickup_lifetime: float = 14.0
@export_range(0.1, 3.0, 0.05) var rock_base_drift_speed: float = 0.75
@export_range(1, 20, 1) var storage_module_rock_cost: int = 4
@export_range(0.5, 10.0, 0.5) var manufacturing_duration: float = 3.0

@onready var _camera: Camera3D = $CameraRig/Camera3D
@onready var _mining_origin: Marker3D = $EscapePod/MiningOrigin
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
var _manufacturing_state: ManufacturingState = ManufacturingState.IDLE


func _ready() -> void:
	_asteroid.health_changed.connect(_on_asteroid_health_changed)
	_asteroid.destroyed.connect(_on_asteroid_destroyed)
	_flyby.flyby_completed.connect(_on_flyby_completed)
	_beam_timer.timeout.connect(_on_beam_timer_timeout)
	_manufacturing_timer.timeout.connect(_on_manufacturing_timer_timeout)
	_hud.reset_requested.connect(_reset_prototype)
	_hud.manufacture_requested.connect(_on_manufacture_requested)
	_hud.show_flyby_active()
	_hud.set_rock_count(_rock_count)
	_refresh_manufacturing_presentation()
	print("Milestone 4 prototype ready.")


func _process(_delta: float) -> void:
	if _manufacturing_state != ManufacturingState.MANUFACTURING:
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
	var ray_origin: Vector3 = _camera.project_ray_origin(screen_position)
	var ray_end: Vector3 = ray_origin + _camera.project_ray_normal(screen_position) * 100.0
	var interaction_mask: int = asteroid_collision_mask | rock_pickup_collision_mask
	var query := PhysicsRayQueryParameters3D.create(ray_origin, ray_end, interaction_mask)
	query.collide_with_areas = true
	query.collide_with_bodies = false
	var result: Dictionary = get_world_3d().direct_space_state.intersect_ray(query)

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
		var position_offset: Vector3 = (
			side_direction * spread_ratio * 1.3
			+ up_direction * (0.45 - absf(spread_ratio) * 0.15)
		)
		var drift_direction: Vector3 = (
			travel_direction
			+ side_direction * spread_ratio * 0.28
			+ up_direction * (0.12 - float(index) * 0.06)
		).normalized()
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
	_manufacturing_state = ManufacturingState.IDLE
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
	_refresh_manufacturing_presentation()
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
	_refresh_manufacturing_presentation()
	print("Collected %d Rock. Inventory: %d" % [quantity, _rock_count])


func _on_manufacture_requested() -> void:
	if _is_resetting or _manufacturing_state != ManufacturingState.IDLE:
		return
	if _rock_count < storage_module_rock_cost:
		_refresh_manufacturing_presentation()
		return

	_manufacturing_state = ManufacturingState.MANUFACTURING
	_rock_count -= storage_module_rock_cost
	_hud.set_rock_count(_rock_count)
	_manufacturing_timer.wait_time = manufacturing_duration
	_manufacturing_timer.start()
	_hud.show_manufacturing_progress(0.0)
	print("Manufacturing Storage Module started. Spent %d Rock." % storage_module_rock_cost)


func _on_manufacturing_timer_timeout() -> void:
	if _manufacturing_state != ManufacturingState.MANUFACTURING:
		return

	_manufacturing_state = ManufacturingState.MODULE_PENDING
	_hud.show_module_pending()
	print("Storage Module complete and pending placement.")


func _refresh_manufacturing_presentation() -> void:
	match _manufacturing_state:
		ManufacturingState.IDLE:
			_hud.show_manufacturing_idle(_rock_count, storage_module_rock_cost)
		ManufacturingState.MANUFACTURING:
			var timer_duration: float = _manufacturing_timer.wait_time
			var progress: float = 0.0
			if timer_duration > 0.0:
				progress = clampf(
					1.0 - (_manufacturing_timer.time_left / timer_duration),
					0.0,
					1.0
				)
			_hud.show_manufacturing_progress(progress)
		ManufacturingState.MODULE_PENDING:
			_hud.show_module_pending()


func _on_beam_timer_timeout() -> void:
	_beam.visible = false
	_beam.mesh = null
