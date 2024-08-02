extends Node2D

@onready var detection_zone = $DetectionZone


enum State {
	PATROL, ENGAGE
}

@onready var currentState = State.PATROL 
var player : CharacterBody2D = null
var actor : CharacterBody2D = null
var shootDelay = 0

signal state_changed(newState)

func set_state(newState: int):
	if currentState != newState:
		currentState = newState
		emit_signal("state_changed", currentState)
	

func _on_detection_zone_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		set_state(State.ENGAGE)
		player = body
		

func initialize(actor):
	self.actor = actor


func _process(delta):
	shootDelay += 1
	match currentState:
		State.PATROL:
			pass
		State.ENGAGE:
			if player != null:
				actor.rotation = actor.global_position.direction_to(player.global_position).angle()
				actor.direction = actor.global_position.direction_to(player.global_position)
				actor.velocity = actor.direction * actor.speed
				var distanceToPlayer = actor.global_position.distance_to(player.global_position)
				
				if distanceToPlayer >= 1000:
					player = null
					set_state(State.PATROL)
					return
				
				if distanceToPlayer >= 310:
					actor.move_and_slide()
				
					
				if shootDelay >= 75:
					actor.shoot()
					shootDelay = 0
				
				
			pass
