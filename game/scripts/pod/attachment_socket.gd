class_name AttachmentSocket
extends Area3D

@export var socket_label: String = "Attachment Socket"

@onready var _collision_shape: CollisionShape3D = $CollisionShape3D
@onready var _marker_visual: Node3D = $MarkerVisual


func _ready() -> void:
	set_placement_active(false)


func set_placement_active(active: bool) -> void:
	_marker_visual.visible = active
	_collision_shape.set_deferred("disabled", not active)

