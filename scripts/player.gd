extends CharacterBody2D

class_name Player

const MIN_DIST_THRESHOLD = 25

@export var Bullet : PackedScene

@onready var health = $Health
@onready var weapon = $Weapon

var lookDirection : Vector2 = Vector2()
var direction : Vector2 = Vector2()
var speed : float = 800.0

var weapon_to_pick_up : WeaponAbstract

signal healthChanged(value: int)
signal death

# read input from the player
func read_input():
	direction = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_pressed("walk"):
		speed = lerp(speed, 400.0, 0.5)
	else:
		speed = lerp(speed, 800.0, 0.5)
	
	velocity = direction * speed
	move_and_slide()

# process the input from the player
func _physics_process(_delta):
	
	var distance_to_mouse = position.distance_to(get_global_mouse_position())

	if distance_to_mouse > MIN_DIST_THRESHOLD:
		look_at(get_global_mouse_position())
	
	read_input()
	
func _process(_delta):
	if (Input.is_action_just_pressed("use")):
		if (weapon_to_pick_up):
			print(weapon_to_pick_up)
			weapon.pick_up_weapon(weapon_to_pick_up)
			pass

	if (Input.is_action_just_pressed("shoot")):
		weapon.shoot()
		
	if (Input.is_action_just_pressed("drop_weapon")):
		weapon.drop_weapon()
	


		
	
func handle_hit(damage: int):
	health.set_health(health.get_health() - damage)
	
	emit_signal("healthChanged", health.get_health())
	
	if health.get_health() <= 0:
		game_over()
		
func game_over():
	death.emit()
	queue_free()
	
