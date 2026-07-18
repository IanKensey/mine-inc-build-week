class_name PrototypeAsteroid
extends Area3D

signal health_changed(current_health: int, maximum_health: int)
signal selection_changed(is_selected: bool)
signal destroyed

@export_range(1, 100, 1) var maximum_health: int = 5
@export_range(0.1, 10.0, 0.1) var movement_speed: float = 1.8

@onready var _visual_root: Node3D = $VisualRoot
@onready var _selection_indicator: MeshInstance3D = $SelectionIndicator
@onready var _collision_shape: CollisionShape3D = $CollisionShape3D
@onready var _destruction_effect: GPUParticles3D = $DestructionEffect
@onready var _destruction_timer: Timer = $DestructionTimer

var current_health: int = 5
var is_destroyed: bool = false
var _is_selected: bool = false
var _is_targetable: bool = true


func _ready() -> void:
	_destruction_timer.timeout.connect(_on_destruction_timer_timeout)
	reset_asteroid()


func take_mining_damage(amount: int) -> void:
	if is_destroyed or not _is_targetable or amount <= 0:
		return

	current_health = maxi(current_health - amount, 0)
	health_changed.emit(current_health, maximum_health)
	print("Asteroid hit for %d mining damage. HP: %d / %d" % [amount, current_health, maximum_health])

	if current_health == 0:
		_destroy()


func set_selected(value: bool) -> void:
	var next_value: bool = value and _is_targetable and not is_destroyed
	if _is_selected == next_value:
		return

	_is_selected = next_value
	_selection_indicator.visible = _is_selected
	selection_changed.emit(_is_selected)


func set_targetable(value: bool) -> void:
	_is_targetable = value and not is_destroyed
	monitorable = _is_targetable
	_collision_shape.set_deferred("disabled", not _is_targetable)
	if not _is_targetable:
		set_selected(false)


func can_be_targeted() -> bool:
	return _is_targetable and not is_destroyed


func reset_asteroid() -> void:
	current_health = maximum_health
	is_destroyed = false
	_is_targetable = true
	_is_selected = false
	_visual_root.visible = true
	_selection_indicator.visible = false
	monitorable = true
	_collision_shape.set_deferred("disabled", false)
	_destruction_effect.emitting = false
	_destruction_effect.visible = false
	_destruction_timer.stop()
	health_changed.emit(current_health, maximum_health)
	selection_changed.emit(false)
	print("Asteroid reset. HP: %d / %d" % [current_health, maximum_health])


func _destroy() -> void:
	if is_destroyed:
		return

	is_destroyed = true
	_is_targetable = false
	_is_selected = false
	monitorable = false
	_collision_shape.set_deferred("disabled", true)
	_selection_indicator.visible = false
	_visual_root.visible = false
	_destruction_effect.visible = true
	_destruction_effect.restart()
	_destruction_effect.emitting = true
	_destruction_timer.start()
	destroyed.emit()
	print("Asteroid destroyed.")


func _on_destruction_timer_timeout() -> void:
	_destruction_effect.emitting = false
	_destruction_effect.visible = false
