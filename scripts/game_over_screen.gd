extends Control

@onready var displayContainer = $Display

func hide_game_over():
	displayContainer.hide()
	
func show_game_over():
	displayContainer.show()

func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
