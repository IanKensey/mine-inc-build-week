extends Node3D

@export_node_path("Node3D") var target_path: NodePath
@export_range(0.001, 0.02, 0.001) var orbit_sensitivity: float = 0.006
@export_range(0.1, 5.0, 0.1) var zoom_step: float = 1.0
@export_range(1.0, 20.0, 0.5) var minimum_distance: float = 5.0
@export_range(5.0, 40.0, 0.5) var maximum_distance: float = 18.0
@export_range(-89.0, 0.0, 1.0) var minimum_pitch_degrees: float = -70.0
@export_range(0.0, 89.0, 1.0) var maximum_pitch_degrees: float = 70.0
@export var default_yaw_degrees: float = 35.0
@export var default_pitch_degrees: float = 18.0
@export_range(1.0, 40.0, 0.5) var default_distance: float = 10.0

@onready var _camera: Camera3D = $Camera3D

var _target: Node3D
var _is_orbiting: bool = false
var _yaw: float = 0.0
var _pitch: float = 0.0
var _distance: float = 10.0


func _ready() -> void:
	var target_node: Node = get_node_or_null(target_path)
	if target_node is not Node3D:
		push_error("OrbitCamera requires a valid Node3D target.")
		set_process(false)
		set_process_unhandled_input(false)
		return

	_target = target_node as Node3D
	_reset_camera()


func _process(_delta: float) -> void:
	_update_camera_transform()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("camera_orbit"):
		_is_orbiting = true
		get_viewport().set_input_as_handled()
	elif event.is_action_released("camera_orbit"):
		_is_orbiting = false
		get_viewport().set_input_as_handled()
	elif event is InputEventMouseMotion and _is_orbiting:
		var mouse_motion: InputEventMouseMotion = event as InputEventMouseMotion
		_yaw -= mouse_motion.relative.x * orbit_sensitivity
		_pitch = clampf(
			_pitch - mouse_motion.relative.y * orbit_sensitivity,
			deg_to_rad(minimum_pitch_degrees),
			deg_to_rad(maximum_pitch_degrees)
		)
		_update_camera_transform()
		get_viewport().set_input_as_handled()
	elif event.is_action_pressed("camera_zoom_in"):
		_distance = clampf(_distance - zoom_step, minimum_distance, maximum_distance)
		_update_camera_transform()
		get_viewport().set_input_as_handled()
	elif event.is_action_pressed("camera_zoom_out"):
		_distance = clampf(_distance + zoom_step, minimum_distance, maximum_distance)
		_update_camera_transform()
		get_viewport().set_input_as_handled()
	elif event.is_action_pressed("camera_reset"):
		_reset_camera()
		get_viewport().set_input_as_handled()


func _reset_camera() -> void:
	_yaw = deg_to_rad(default_yaw_degrees)
	_pitch = deg_to_rad(default_pitch_degrees)
	_distance = clampf(default_distance, minimum_distance, maximum_distance)
	_update_camera_transform()
	print("Camera reset to default position.")


func _update_camera_transform() -> void:
	if not is_instance_valid(_target):
		return

	var horizontal_distance: float = _distance * cos(_pitch)
	var offset := Vector3(
		horizontal_distance * sin(_yaw),
		_distance * sin(_pitch),
		horizontal_distance * cos(_yaw)
	)
	var focus_position: Vector3 = _target.global_position
	_camera.global_position = focus_position + offset
	_camera.look_at(focus_position, Vector3.UP)
