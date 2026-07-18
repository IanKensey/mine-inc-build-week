class_name PrototypeHUD
extends CanvasLayer

signal reset_requested
signal manufacture_requested

@onready var _target_status: Label = $InfoPanel/Margin/Content/TargetStatus
@onready var _health: Label = $InfoPanel/Margin/Content/Health
@onready var _rock_count: Label = $InfoPanel/Margin/Content/RockCount
@onready var _reset_button: Button = $InfoPanel/Margin/Content/ResetButton
@onready var _manufacturing_cost: Label = $ManufacturingPanel/Margin/Content/Cost
@onready var _manufacturing_status: Label = $ManufacturingPanel/Margin/Content/Status
@onready var _manufacturing_progress: ProgressBar = $ManufacturingPanel/Margin/Content/Progress
@onready var _manufacture_button: Button = $ManufacturingPanel/Margin/Content/ManufactureButton


func _ready() -> void:
	_reset_button.pressed.connect(_on_reset_button_pressed)
	_manufacture_button.pressed.connect(_on_manufacture_button_pressed)


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


func show_manufacturing_idle(rock_count: int, rock_cost: int) -> void:
	_manufacturing_cost.text = "Cost: %d Rock" % rock_cost
	_manufacturing_progress.value = 0.0
	var remaining_rock: int = maxi(rock_cost - rock_count, 0)
	if remaining_rock > 0:
		_manufacturing_status.text = "Need %d more Rock" % remaining_rock
		_manufacture_button.disabled = true
	else:
		_manufacturing_status.text = "Ready to manufacture"
		_manufacture_button.disabled = false


func show_manufacturing_progress(progress: float) -> void:
	_manufacturing_status.text = "Manufacturing Storage Module…"
	_manufacturing_progress.value = clampf(progress, 0.0, 1.0) * 100.0
	_manufacture_button.disabled = true


func show_module_pending() -> void:
	_manufacturing_status.text = "Storage Module complete\nPending placement"
	_manufacturing_progress.value = 100.0
	_manufacture_button.disabled = true


func _on_reset_button_pressed() -> void:
	reset_requested.emit()


func _on_manufacture_button_pressed() -> void:
	manufacture_requested.emit()
