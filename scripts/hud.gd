extends Node2D

@onready var healthBar = $Display/HealthBar

func _on_player_health_changed(value: int):
	healthBar.setValue(value)
