extends CharacterBody2D

@export var Bullet : PackedScene

@onready var ai = $AI



var direction : Vector2 = Vector2()
var speed : float = 200.0

func _ready():
	ai.initialize(self)
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform

func _physics_process(delta):
	pass
		
	
	

