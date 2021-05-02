extends MeshInstance


var material: ShaderMaterial = null
var time = 0.0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if material == null:
		material = mesh.surface_get_material(0).duplicate()
		self.set_surface_material(0, material)
	
	material.set_shader_param("animate", time)
	
	time += delta
	if time > 1.0:
		queue_free()
