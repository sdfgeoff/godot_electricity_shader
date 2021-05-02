extends Spatial


export var ROTATION_SPEED = 0.1;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotation.y += delta * ROTATION_SPEED
