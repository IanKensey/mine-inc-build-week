extends Node3D

@export_range(1, 100, 1) var mining_damage: int = 1
@export_flags_3d_physics var asteroid_collision_mask: int = 2
@export_range(0.05, 1.0, 0.05) var beam_duration: float = 0.18

@onready var _camera: Camera3D = $CameraRig/Camera3D
@onready var _mining_origin: Marker3D = $EscapePod/MiningOrigin
@onready var _flyby: AsteroidFlyby = $AsteroidPath/AsteroidFlyby
@onready var _asteroid: PrototypeAsteroid = $AsteroidPath/AsteroidFlyby/Asteroid
@onready var _beam: MeshInstance3D = $MiningBeam
@onready var _beam_timer: Timer = $MiningBeamTimer
@onready var _hud: PrototypeHUD = $PrototypeHUD

var _selected_asteroid: PrototypeAsteroid


func _ready() -> void:
	_asteroid.health_changed.connect(_on_asteroid_health_changed)
	_asteroid.destroyed.connect(_on_asteroid_destroyed)
	_flyby.flyby_completed.connect(_on_flyby_completed)
	_beam_timer.timeout.connect(_on_beam_timer_timeout)
	_hud.reset_requested.connect(_reset_prototype)
	_hud.show_flyby_active()
	print("Milestone 2 prototype ready.")


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_button: InputEventMouseButton = event as InputEventMouseButton
		if mouse_button.button_index == MOUSE_BUTTON_LEFT and mouse_button.pressed:
			_select_at_screen_position(mouse_button.position)
			get_viewport().set_input_as_handled()
			return

	if event.is_action_pressed("fire_mining_tool"):
		if event is InputEventKey and (event as InputEventKey).echo:
			return
		_fire_mining_shot()
		get_viewport().set_input_as_handled()


func _select_at_screen_position(screen_position: Vector2) -> void:
	var ray_origin: Vector3 = _camera.project_ray_origin(screen_position)
	var ray_end: Vector3 = ray_origin + _camera.project_ray_normal(screen_position) * 100.0
	var query := PhysicsRayQueryParameters3D.create(ray_origin, ray_end, asteroid_collision_mask)
	query.collide_with_areas = true
	query.collide_with_bodies = false
	var result: Dictionary = get_world_3d().direct_space_state.intersect_ray(query)

	if result.is_empty():
		_clear_selection()
		return

	var collider: Object = result.get("collider") as Object
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


func _reset_prototype() -> void:
	_clear_selection()
	_beam_timer.stop()
	_beam.visible = false
	_beam.mesh = null
	_flyby.reset_flyby()
	_hud.show_flyby_active()
	print("Prototype reset requested.")


func _on_asteroid_health_changed(current_health: int, maximum_health: int) -> void:
	if _selected_asteroid == _asteroid:
		_hud.show_selected(current_health, maximum_health)


func _on_asteroid_destroyed() -> void:
	_flyby.stop_flyby()
	_selected_asteroid = null
	_hud.show_destroyed(_asteroid.maximum_health)


func _on_flyby_completed() -> void:
	_selected_asteroid = null
	_hud.show_flyby_complete()


func _on_beam_timer_timeout() -> void:
	_beam.visible = false
	_beam.mesh = null
