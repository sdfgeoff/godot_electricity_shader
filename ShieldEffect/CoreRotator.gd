extends MeshInstance

var time = 0.0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta;
	
	self.rotation += Vector3(
		sin(time * 0.1),
		cos(time*0.3),
		sin(time * 0.2)
	) * delta
