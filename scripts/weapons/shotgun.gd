extends WeaponAbstract

@onready var muzzle = $Muzzle

func shoot():
	var b = projectile.instantiate()
	gameNode.add_child(b)
	b.transform = muzzle.get_global_transform()
	for angle in [-170, 170]:
		var radians = deg_to_rad(angle)
		var bullet = projectile.instantiate()
		gameNode.add_child(bullet)
		bullet.transform = muzzle.get_global_transform()
		bullet.rotate(angle)
		
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
