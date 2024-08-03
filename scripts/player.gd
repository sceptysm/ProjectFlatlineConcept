extends CharacterBody2D

class_name Player


@export var Bullet : PackedScene


@onready var health = $Health


var lookDirection : Vector2 = Vector2()
var direction : Vector2 = Vector2()
var speed : float = 800.0
var smooothed_target_pos: Vector2



# read input from the player
func read_input():
	direction = Input.get_vector("left", "right", "up", "down")

	
	velocity = direction * speed
	move_and_slide()

# process the input from the player
func _physics_process(delta):
	
	#figure out a good clamp/lerp for rotation
#	smooothed_target_pos = lerp(smooothed_target_pos, get_global_mouse_position(), 70 * delta)
#	var angle = position.direction_to(smooothed_target_pos).angle()
#	look_at(smooothed_target_pos)
	look_at(get_global_mouse_position())
	#$Muzzle.look_at(get_global_mouse_position())
	
	read_input()
	
func _process(delta):
	if (Input.is_action_just_pressed("shoot")):
		shoot()
		
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	
	
func handle_hit(damage: int):
	health.set_health(health.get_health() - damage)
	
	if health.get_health() <= 0:
		queue_free()
	
