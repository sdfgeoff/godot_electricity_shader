extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0.0;

export var SPLASH_SCENE: PackedScene = null


func _ready():
	contact_monitor = true
	contacts_reported = 2
	connect("body_entered", self, "_on_body_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	
	var mesh = get_node("MeshInstance").mesh
	var material = mesh.surface_get_material(0)
	material.set_shader_param("animate", time * 0.2)

func _on_body_entered(data):
	# We hit something. Delete the bullet
	
	var splash: Spatial = SPLASH_SCENE.instance()
	get_parent().add_child(splash)
	splash.transform = self.transform
	#splash.look_at_from_position(self.translation, data.translation, Vector3(0.0, 1.0, 0.0))

	if data.has_method("inflict_damage"):
		data.inflict_damage(1.0, self)

	queue_free()
