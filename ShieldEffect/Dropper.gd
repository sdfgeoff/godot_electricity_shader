extends Spatial
# Drops bullets


export var BULLET_SCENE: PackedScene = null
export var TIME_BETWEEN_SHOTS = 10.0;

var reload_time: float = 0.0
var time: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	reload_time += delta
	time += delta
	if reload_time > TIME_BETWEEN_SHOTS:
		reload_time -= TIME_BETWEEN_SHOTS
		var bullet: Spatial = BULLET_SCENE.instance()
		bullet.translation = Vector3(sin(time) * 5.0, translation.y, cos(time * 1.432))
		add_child(bullet)
	
