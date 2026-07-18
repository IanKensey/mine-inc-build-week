class_name PrototypeHUD
extends CanvasLayer

signal reset_requested

@onready var _target_status: Label = $InfoPanel/Margin/Content/TargetStatus
@onready var _health: Label = $InfoPanel/Margin/Content/Health
@onready var _rock_count: Label = $InfoPanel/Margin/Content/RockCount
@onready var _reset_button: Button = $InfoPanel/Margin/Content/ResetButton


func _ready() -> void:
	_reset_button.pressed.connect(_on_reset_button_pressed)


func show_flyby_active() -> void:
	_target_status.text = "Asteroid in flight — not selected"
	_health.text = "HP: —"


func show_selected(current_health: int, maximum_health: int) -> void:
	_target_status.text = "Asteroid selected"
	_health.text = "HP: %d / %d" % [current_health, maximum_health]


func show_destroyed(maximum_health: int) -> void:
	_target_status.text = "Asteroid destroyed"
	_health.text = "HP: 0 / %d" % maximum_health


func show_flyby_complete() -> void:
	_target_status.text = "Fly-by complete"
	_health.text = "HP: —"


func set_rock_count(quantity: int) -> void:
	_rock_count.text = "Rock: %d" % quantity


func _on_reset_button_pressed() -> void:
	reset_requested.emit()
