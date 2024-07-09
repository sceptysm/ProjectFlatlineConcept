extends CharacterBody2D

@export var Bullet : PackedScene

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
	
	look_at(get_global_mouse_position())
	read_input()
	
func _process(delta):
	if (Input.is_action_just_pressed("shoot")):
		shoot()
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	


	
