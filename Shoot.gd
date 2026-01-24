extends CharacterBody2D

var life = 2
var spawn = 0
var moveSpeed = 300

func _physics_process(delta: float):
	var collision = move_and_collide(Vector2.UP * delta * moveSpeed)
	
	if collision != null:
		var collider = collision.get_collider()
		if collider != null and collider.has_method("kill"):
			collider.kill()
			queue_free()
	
	spawn += delta
	if spawn > 2:
		queue_free()
