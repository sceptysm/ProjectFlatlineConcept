extends Node2D


@onready var damage : int
@onready var projectile : PackedScene
#@onready var muzzle : Node2D = $Muzzle # Change later to weapon scene based muzzle
@onready var weaponName : StringName

@onready var weaponPacked : PackedScene = preload("res://scenes/weapons/assault_rifle.tscn") #?? get rid of this ? 

var weapon_instance : WeaponAbstract = null

# --------------------
# WEAPON NODE TEST



func _ready():
	load_weapon_entry(weaponPacked)
	
	

func load_weapon_entry(weaponScene):
	var instance = weaponScene.instantiate()
	damage = instance.damage
	projectile = instance.projectile
	weaponName = instance.weaponName

	#assign weapon to player
	weapon_instance = instance
	add_child(instance)
	weapon_instance.set_is_dropped(false)

func load_weapon(instance):

	damage = instance.damage
	projectile = instance.projectile
	weaponName = instance.weaponName

	
	instance.set_is_dropped(false)
	
	var weapon_parent = instance.get_parent()
	if (weapon_parent):
		instance.get_parent().remove_child(instance)
	
	add_child(instance)
	instance.transform = transform
	weapon_instance = instance
	
	

func drop_weapon():
	if (weapon_instance):
		weapon_instance.reparent(get_tree().get_root())
		weapon_instance.global_position = self.global_position
		weapon_instance = null
	
	

func pick_up_weapon(weapon_to_pickup : WeaponAbstract):
	if (weapon_instance):
		drop_weapon()
	
	load_weapon(weapon_to_pickup)	




func shoot():	
	if (weapon_instance != null):
		weapon_instance.shoot()

func _physics_process(delta):
	pass 
