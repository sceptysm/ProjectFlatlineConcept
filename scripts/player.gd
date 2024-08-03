extends CharacterBody2D

class_name Player

const MIN_DIST_THRESHOLD = 25

@export var Bullet : PackedScene

@onready var health = $Health
@onready var weapon = $Weapon

var lookDirection : Vector2 = Vector2()
var direction : Vector2 = Vector2()
var speed : float = 800.0


# read input from the player
func read_input():
	direction = Input.get_vector("left", "right", "up", "down")

	
	velocity = direction * speed
	move_and_slide()

# process the input from the player
func _physics_process(delta):
	
	var distance_to_mouse = position.distance_to(get_global_mouse_position())

	if distance_to_mouse > MIN_DIST_THRESHOLD:
		look_at(get_global_mouse_position())
	
	read_input()
	
func _process(delta):
	if (Input.is_action_just_pressed("shoot")):
		weapon.shoot()
		
	
func handle_hit(damage: int):
	health.set_health(health.get_health() - damage)
	
	if health.get_health() <= 0:
		queue_free()
		

	
