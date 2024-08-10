extends Node2D

@onready var hud = $HUD

func _ready():
	show_hud(true)  # Show the HUD when the game starts

func show_hud(visible: bool):
	hud.visible = visible

func _on_some_event():
	# Attatch function to some event to hide HUD
	# e.g. on player death
	show_hud(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
