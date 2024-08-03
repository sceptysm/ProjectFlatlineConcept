extends Node2D

@export var WEAPON_TYPE : Weapons:
	set(value):
		WEAPON_TYPE = value
		load_weapon()

@onready var damage : int
@onready var projectile : PackedScene
@onready var muzzle : Node2D = $Muzzle
@onready var weaponName : StringName

func _ready():
	load_weapon()

func load_weapon():
	damage = WEAPON_TYPE.damage
	projectile = WEAPON_TYPE.projectile
	weaponName = WEAPON_TYPE.name
	
# Find a way to interface shooting
# A way to do it might be to possible create an extension script
# for the weapon script that overrides this function while utilising the resource.
func shoot():
	var b = projectile.instantiate()
	owner.owner.add_child(b)
	b.transform = muzzle.get_global_transform()
	
	if (weaponName == "Shottie"):
		
		for angle in [-170, 170]:
			var radians = deg_to_rad(angle)
			var bullet = projectile.instantiate()
			owner.owner.add_child(bullet)
			bullet.transform = muzzle.get_global_transform()
			bullet.rotate(angle)
			#bullet.global_position = self.global_position
		
	
func _physics_process(delta):
	if Input.is_action_just_pressed("cycle_weapon"):
		
		if weaponName == "AR":
			WEAPON_TYPE = load("res://resources/shotgun.tres")
		else:
			WEAPON_TYPE = load("res://resources/assault_rifle.tres")
