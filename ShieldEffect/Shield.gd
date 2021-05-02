# Computes damage on the shield
extends StaticBody


export var MAX_HEALTH = 10.0;
export var SHIELD_REGEN_SECONDS = 5.0;
export var SPLASH_SCENE: PackedScene = null;

var health = MAX_HEALTH
var shield_up = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health >= MAX_HEALTH:
		health = MAX_HEALTH
		shield_up = true
	else:
		health += delta / SHIELD_REGEN_SECONDS * MAX_HEALTH
	
	if health <= 0.0:
		health = 0.0
		shield_up = false
	
	var shield_visuals = get_node("ShieldVisuals")
	shield_visuals.health = health / MAX_HEALTH
	shield_visuals.shield_up = shield_up
	
	get_node("CollisionShape").disabled = !shield_up
	
func inflict_damage(damage, bullet):
	health -= damage
	
	
	var splash: Spatial = SPLASH_SCENE.instance()
	get_parent().add_child(splash)
	splash.transform = self.transform
	
	splash.look_at_from_position(self.translation, bullet.translation, Vector3(0.0, 1.0, 0.0))
