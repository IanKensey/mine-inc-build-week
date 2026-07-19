class_name PrototypeHUD
extends CanvasLayer

signal reset_requested
signal manufacture_requested
signal storage_module_selected
signal attach_or_cancel_requested

@onready var _target_status: Label = $InfoPanel/Margin/Content/TargetStatus
@onready var _health: Label = $InfoPanel/Margin/Content/Health
@onready var _rock_count: Label = $InfoPanel/Margin/Content/RockCount
@onready var _reset_button: Button = $InfoPanel/Margin/Content/ResetButton
@onready var _manufacturing_cost: Label = $ManufacturingPanel/Margin/Content/Cost
@onready var _manufacturing_status: Label = $ManufacturingPanel/Margin/Content/Status
@onready var _manufacturing_progress: ProgressBar = $ManufacturingPanel/Margin/Content/Progress
@onready var _manufacture_button: Button = $ManufacturingPanel/Margin/Content/ManufactureButton
@onready var _cargo_rock_slot: Button = $CargoPanel/Margin/Content/CargoGrid/RockSlot
@onready var _module_slot: Button = $CargoPanel/Margin/Content/CargoGrid/StorageModuleSlot
@onready var _cargo_status: Label = $CargoPanel/Margin/Content/CargoStatus
@onready var _attach_button: Button = $CargoPanel/Margin/Content/AttachButton


func _ready() -> void:
	_reset_button.pressed.connect(_on_reset_button_pressed)
	_manufacture_button.pressed.connect(_on_manufacture_button_pressed)
	_module_slot.pressed.connect(_on_storage_module_slot_pressed)
	_attach_button.pressed.connect(_on_attach_button_pressed)


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
	_cargo_rock_slot.text = "Rock\n%d" % quantity


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


func show_module_in_cargo() -> void:
	_manufacturing_status.text = "Storage Module complete\nAvailable in Cargo"
	_manufacturing_progress.value = 100.0
	_manufacture_button.disabled = true


func show_module_placement_active() -> void:
	_manufacturing_status.text = "Storage Module complete\nPlacement active"
	_manufacturing_progress.value = 100.0
	_manufacture_button.disabled = true


func show_module_attached() -> void:
	_manufacturing_status.text = "Storage Module attached\nInstalled on escape pod"
	_manufacturing_progress.value = 100.0
	_manufacture_button.disabled = true


func show_cargo_not_built() -> void:
	_set_module_slot(false, false)
	_cargo_status.text = "Storage Module slot empty"
	_set_attach_button(false, false)


func show_cargo_manufacturing() -> void:
	_set_module_slot(false, false)
	_cargo_status.text = "Storage Module in production"
	_set_attach_button(false, false)


func show_cargo_module_available(selected: bool) -> void:
	_set_module_slot(true, selected)
	if selected:
		_cargo_status.text = "Storage Module selected"
	else:
		_cargo_status.text = "Select Storage Module"
	_set_attach_button(selected, false)


func show_cargo_placement_active() -> void:
	_set_module_slot(false, true)
	_cargo_status.text = "Choose an attachment socket"
	_set_attach_button(true, true)


func show_cargo_attached() -> void:
	_set_module_slot(false, false)
	_cargo_status.text = "Storage Module attached — pod expanded."
	_set_attach_button(false, false)


func _set_module_slot(available: bool, selected: bool) -> void:
	_module_slot.disabled = not available
	if selected:
		_module_slot.text = "SELECTED\nStorage Module"
		_module_slot.modulate = Color(0.4, 0.95, 1.0, 1.0)
	elif available:
		_module_slot.text = "Storage\nModule"
		_module_slot.modulate = Color.WHITE
	else:
		_module_slot.text = "Empty"
		_module_slot.modulate = Color.WHITE


func _set_attach_button(enabled: bool, cancel_mode: bool) -> void:
	_attach_button.disabled = not enabled
	_attach_button.text = "Cancel Placement" if cancel_mode else "Attach"


func _on_reset_button_pressed() -> void:
	reset_requested.emit()


func _on_manufacture_button_pressed() -> void:
	manufacture_requested.emit()


func _on_storage_module_slot_pressed() -> void:
	storage_module_selected.emit()


func _on_attach_button_pressed() -> void:
	attach_or_cancel_requested.emit()
