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


func _complete_flyby() -> void:
	if _completion_emitted:
		return

	_completion_emitted = true
	is_running = false
	asteroid.set_targetable(false)
	flyby_completed.emit()
	print("Asteroid fly-by complete.")
