class_name KatanaSlash extends Area2D

var damage = 20
var lifetime = 0.2 # 3 seconds
var fade_time = 0.15 # time after which projectile starts fading
var timer = 0.0

@onready var sprite = $KatanaSlash
var is_alive = true;

func _process(delta):
	# guard to prevent alpha modulation being called on a null instance
	if not is_alive:
		return
	
	timer += delta
	if timer > fade_time:
		var alpha = clamp(1.0 - ((timer - fade_time) / (lifetime - fade_time)), 0, 1)
		sprite.modulate.a = alpha  # adjust sprite alpha
	
	if timer >= lifetime:
		queue_free() # delete projectile after lifetime over

func _on_body_entered(body):
	# temporary fix, we need an actual projectile ownership system
	if body.is_in_group("Player"):
		return
	if body.has_method("handle_hit"):
		body.handle_hit(damage)
		is_alive = false
		queue_free()
