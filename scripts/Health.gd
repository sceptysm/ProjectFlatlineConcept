extends Node2D

@export var health = 100: set = set_health, get = get_health

func set_health(value: int):
	health = clamp(value, 0, 100)
	
func get_health():
	return health
