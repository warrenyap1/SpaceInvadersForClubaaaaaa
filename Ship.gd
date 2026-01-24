extends CharacterBody2D

var speed = 250
var cooldown = 0

func _physics_process(delta: float):
	velocity.x = 0
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		
	move_and_slide()
	
	cooldown += delta
	
	if Input.is_action_pressed("ui_accept") and cooldown > 0.5:
		fire()
		cooldown = 0
		
func fire():
	var bullet = preload("res://Bullet.tscn")
	var firedBullet = bullet.instantiate()
	firedBullet.position = Vector2(position.x, -40)
	get_parent().call_deferred("add_child", firedBullet)
