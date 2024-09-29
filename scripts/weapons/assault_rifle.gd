extends WeaponAbstract

@onready var muzzle = $Muzzle

func shoot():
	var b = projectile.instantiate()
	gameNode.add_child(b)
	b.transform = muzzle.get_global_transform()
	
func alt_fire():
	pass

func _on_weapon_area_entered(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		body.weapon_to_pick_up = self
	pass # Replace with function body.

func _on_weapon_are_exited(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		body.weapon_to_pick_up = null
	pass # Replace with function body.
