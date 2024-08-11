extends Area2D

@onready var lifetime = $HitboxLifetime

func _ready():
	lifetime.start()


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):

	if lifetime.is_stopped():
		queue_free()


func _on_body_entered(body):
	
#	var fA = Vector2(transform.looking_at().x.x, transform.looking_at().y.y)
#	var AP = (body.position - self.position).normalized()
#	var dot = AP.dot(fA)

	
	if body.has_method("handle_hit"):
		#body.handle_hit(50)
		queue_free()
