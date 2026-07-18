class_name TrajectoryRenderer
extends Node3D

@export_node_path("Path3D") var path_path: NodePath = NodePath("..")
@export_range(0.25, 4.0, 0.05) var dot_spacing: float = 0.8
@export_range(0.02, 0.5, 0.01) var dot_radius: float = 0.07
@export var dot_color: Color = Color(0.18, 0.8, 1.0, 1.0)
@export_range(0.1, 8.0, 0.1) var emission_energy: float = 2.2

@onready var _dots: MultiMeshInstance3D = $Dots


func _ready() -> void:
	_build_trajectory_once()


func _build_trajectory_once() -> void:
	var path_node: Node = get_node_or_null(path_path)
	if path_node is not Path3D:
		push_error("TrajectoryRenderer requires a valid Path3D.")
		return

	var path: Path3D = path_node as Path3D
	var path_length: float = path.curve.get_baked_length()
	var dot_count: int = maxi(int(floor(path_length / dot_spacing)) + 1, 2)

	var material := StandardMaterial3D.new()
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = dot_color
	material.emission_enabled = true
	material.emission = dot_color
	material.emission_energy_multiplier = emission_energy

	var dot_mesh := SphereMesh.new()
	dot_mesh.radius = dot_radius
	dot_mesh.height = dot_radius * 2.0
	dot_mesh.radial_segments = 8
	dot_mesh.rings = 4
	dot_mesh.material = material

	var dots_multimesh := MultiMesh.new()
	dots_multimesh.transform_format = MultiMesh.TRANSFORM_3D
	dots_multimesh.mesh = dot_mesh
	dots_multimesh.instance_count = dot_count

	for index: int in dot_count:
		var distance: float = minf(float(index) * dot_spacing, path_length)
		var point: Vector3 = path.curve.sample_baked(distance, true)
		dots_multimesh.set_instance_transform(index, Transform3D(Basis.IDENTITY, point))

	_dots.multimesh = dots_multimesh
	print("Trajectory generated once with %d dots." % dot_count)
