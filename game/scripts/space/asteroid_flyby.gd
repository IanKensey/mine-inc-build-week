class_name AsteroidFlyby
extends PathFollow3D

signal flyby_completed

@onready var asteroid: PrototypeAsteroid = $Asteroid

var is_running: bool = false
var _completion_emitted: bool = false


func _ready() -> void:
	loop = false
	reset_flyby()


func _process(delta: float) -> void:
	if not is_running or asteroid.is_destroyed:
		return

	var path: Path3D = get_parent() as Path3D
	var path_length: float = path.curve.get_baked_length()
	progress = minf(progress + asteroid.movement_speed * delta, path_length)

	if progress >= path_length:
		_complete_flyby()


func reset_flyby() -> void:
	progress = 0.0
	_completion_emitted = false
	is_running = true
	asteroid.reset_asteroid()
	print("Asteroid fly-by started.")


func stop_flyby() -> void:
	is_running = false


func get_travel_direction() -> Vector3:
	var path: Path3D = get_parent() as Path3D
	var path_length: float = path.curve.get_baked_length()
	var sample_offset: float = 0.25
	var from_distance: float = maxf(progress - sample_offset, 0.0)
	var to_distance: float = minf(progress + sample_offset, path_length)
	var local_direction: Vector3 = (
		path.curve.sample_baked(to_distance, true)
		- path.curve.sample_baked(from_distance, true)
	).normalized()

	if local_direction.is_zero_approx():
		return Vector3.RIGHT

	return (path.global_basis * local_direction).normalized()


func _complete_flyby() -> void:
	if _completion_emitted:
		return

	_completion_emitted = true
	is_running = false
	asteroid.set_targetable(false)
	flyby_completed.emit()
	print("Asteroid fly-by complete.")
