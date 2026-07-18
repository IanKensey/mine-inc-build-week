class_name RockPickup
extends Area3D

signal collected(quantity: int)


class FadeMaterialState:
	var material: StandardMaterial3D
	var original_albedo_color: Color

	func _init(source_material: StandardMaterial3D, source_albedo_color: Color) -> void:
		material = source_material
		original_albedo_color = source_albedo_color


@export_range(1, 100, 1) var quantity: int = 2
@export var drift_velocity: Vector3 = Vector3.ZERO
@export_range(1.0, 60.0, 0.5) var lifetime_seconds: float = 14.0
@export_range(0.0, 10.0, 0.5) var fade_duration_seconds: float = 3.0

@onready var _collision_shape: CollisionShape3D = $CollisionShape3D
@onready var _lifetime_timer: Timer = $LifetimeTimer

var _interaction_enabled: bool = true
var _elapsed_lifetime: float = 0.0
var _fade_materials: Array[FadeMaterialState] = []


func _ready() -> void:
	for child: Node in $VisualRoot.get_children():
		if child is MeshInstance3D:
			var visual_mesh: MeshInstance3D = child as MeshInstance3D
			var active_material: Material = visual_mesh.get_active_material(0)
			if active_material is not StandardMaterial3D:
				push_warning("Rock pickup visual requires a StandardMaterial3D to fade.")
				continue

			var instance_material: StandardMaterial3D = (
				(active_material as StandardMaterial3D).duplicate(true) as StandardMaterial3D
			)
			instance_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			visual_mesh.material_override = instance_material
			_fade_materials.append(FadeMaterialState.new(
				instance_material,
				instance_material.albedo_color
			))

	_lifetime_timer.timeout.connect(_on_lifetime_expired)
	_lifetime_timer.start(lifetime_seconds)


func _physics_process(delta: float) -> void:
	global_position += drift_velocity * delta
	_elapsed_lifetime = minf(_elapsed_lifetime + delta, lifetime_seconds)
	_update_fade()


func collect() -> void:
	if not _interaction_enabled:
		return

	_disable_interaction_immediately()
	collected.emit(quantity)
	queue_free()


func discard_without_collection() -> void:
	if not _interaction_enabled:
		return

	_disable_interaction_immediately()
	queue_free()


func can_be_collected() -> bool:
	return _interaction_enabled


func _update_fade() -> void:
	var fade_duration: float = minf(fade_duration_seconds, lifetime_seconds)
	if fade_duration <= 0.0:
		return

	var fade_start: float = lifetime_seconds - fade_duration
	var fade_progress: float = clampf(
		(_elapsed_lifetime - fade_start) / fade_duration,
		0.0,
		1.0
	)
	var opacity: float = 1.0 - fade_progress
	for fade_material: FadeMaterialState in _fade_materials:
		var faded_albedo: Color = fade_material.original_albedo_color
		faded_albedo.a = opacity
		fade_material.material.albedo_color = faded_albedo


func _disable_interaction_immediately() -> void:
	_interaction_enabled = false
	set_physics_process(false)
	monitoring = false
	monitorable = false
	_collision_shape.set_deferred("disabled", true)
	_lifetime_timer.stop()


func _on_lifetime_expired() -> void:
	discard_without_collection()
