extends Area2D

func _physics_process(delta: float):
	position.y += 2


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Ship":
		get_tree().reload_current_scene()
	if body.name == "Shot":
		queue_free()
