extends MeshInstance

const HEAL_SECONDS = 5.0
const RAISE_LOWER_SECONDS = 1.0

var time = 0.0

export var shield_level = 0.0;
export var health = 1.0;

# Used to determine contact with the ground
export var min_shield_level: float = 0.0;


export var shield_up: bool = false


func _process(delta):
	var material = self.get_surface_material(0)
	time += delta
	
	if shield_up:
		# Animate shield raising
		shield_level = min(shield_level + delta / RAISE_LOWER_SECONDS, 1.0)
	else:
		# Animate shield falling
		shield_level = max(shield_level - delta / RAISE_LOWER_SECONDS, min_shield_level)

	material.set_shader_param("animate", time * 0.2)
	material.set_shader_param("shield_level", shield_level)
	material.set_shader_param("health", health)
