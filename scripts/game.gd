extends Node2D

@onready var hud = $HUD
@onready var game_over_screen = $"Game Over Screen"

func _ready():
	hud.show_HUD()
	game_over_screen.hide_game_over()

func _on_player_death():
	hud.hide_HUD()
	game_over_screen.show_game_over()

func _process(delta):
	pass
