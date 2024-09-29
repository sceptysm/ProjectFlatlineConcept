class_name WeaponAbstract extends Node2D

@export var projectile : PackedScene
@export var weaponName : StringName
@export var damage : int
@export var attackType : String
@onready var gameNode #or level node

var is_dropped : bool

func _ready() -> void:
	gameNode = get_tree().get_root().get_node("game")
	print(gameNode)
	is_dropped = true

func set_is_dropped(val):
	is_dropped = val
	
func shoot():
	push_error("WeaponAbstract: shoot() not implemented")
	
func alt_fire():
	push_error("WeaponAbstract: alt_fire() not implemented")

func _on_weapon_area_entered(body: Node2D) -> void:
	push_error("WeaponAbstract: _on_weapon_area_entered() not implemented")

func _on_weapon_are_exited(body: Node2D) -> void:
	push_error("WeaponAbstract: _on_weapon_area_exited() not implemented")
