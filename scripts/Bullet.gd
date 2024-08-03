extends Area2D


var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit(20)
		queue_free()
