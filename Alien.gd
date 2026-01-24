extends CharacterBody2D

var moveSpeed = 10

var shootTimer = randf_range(0, 50)

func _physics_process(delta: float):
	var collision = move_and_collide(Vector2.DOWN * delta * moveSpeed)
	
	shootTimer += delta
	if shootTimer >= 50:
		var bullet = preload("res://AlienBullet.tscn")
		var firedBullet = bullet.instantiate()
		firedBullet.position = Vector2(position.x, position.y + 10)
		get_parent().call_deferred("add_child", firedBullet)
		
		shootTimer = randf_range(0, 50)
		
func kill():
	queue_free()
