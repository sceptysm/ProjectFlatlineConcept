extends CharacterBody2D

@export var Bullet : PackedScene

@onready var ai = $AI
@onready var health = $Health

var direction : Vector2 = Vector2()
var speed : float = 400.0

func _ready():
	ai.initialize(self)
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform

func _physics_process(delta):
	pass

func handle_hit(damage: int):
			
	health.set_health(health.get_health() - damage)
	
	if health.get_health() <= 0:
		queue_free()
