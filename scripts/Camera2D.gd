extends Camera2D

var target_pos = Vector2()
var target_distance = 0

@onready var center_pos = get_parent().global_position

const MAX_DISTANCE = 240 # max distance the camera can travel
const MAX_DISTANCE_VECTOR = Vector2(MAX_DISTANCE,MAX_DISTANCE)

func _input(event):
	if event is InputEventMouseMotion:
		target_distance = center_pos.distance_to(get_local_mouse_position()) / 2 # target distance is in the middle of the line between player and mouse
 
func _physics_process(delta):
	
	#Camera Handling
	var direction = center_pos.direction_to(get_local_mouse_position())
	target_pos = center_pos + direction * target_distance
	#target_pos = lerp(position, target_pos.clamp(center_pos - MAX_DISTANCE_VECTOR, center_pos + MAX_DISTANCE_VECTOR), delta)
	target_pos = target_pos.clamp(center_pos - MAX_DISTANCE_VECTOR, center_pos + MAX_DISTANCE_VECTOR)
	
	position = target_pos


