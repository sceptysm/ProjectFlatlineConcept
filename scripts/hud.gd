extends Node2D

@onready var displayContainer = $Display
@onready var healthBar = $Display/HealthBar

func hide_HUD():
	displayContainer.hide()
	
func show_HUD():
	displayContainer.show()

func _on_player_health_changed(value: int):
	healthBar.setValue(value)
