extends WeaponAbstract

@onready var muzzle = $Muzzle

func shoot():
	var total_duration = 0.01
	var delay = 0.001  # Delay between each projectile in seconds
	var elapsed_time = 0.0
	
	while elapsed_time < total_duration:
		# Instantiate and add a projectile to the scene
		var slash = projectile.instantiate()
		gameNode.add_child(slash)
		slash.transform = muzzle.get_global_transform()
		
		# Wait for the delay before spawning the next projectile
		await get_tree().create_timer(delay).timeout
	
		# Increment the elapsed time
		elapsed_time += delay
		
func alt_fire():
	pass

func _on_pick_up_area_body_entered(body):
	if (body.is_in_group("Player")):
		body.weapon_to_pick_up = self
	pass

func _on_pick_up_area_body_exited(body):
	if (body.is_in_group("Player")):
		body.weapon_to_pick_up = null
	pass
