extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0 
	var phys_mat = PhysicsMaterial.new()
	phys_mat.bounce = 1
	 
	phys_mat.friction = 0.2
	physics_material_override = phys_mat
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func launch( force : Vector2) -> void:
	gravity_scale = 1 
	apply_impulse(force * 5,Vector2.ZERO)
