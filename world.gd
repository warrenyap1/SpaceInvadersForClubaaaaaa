extends Node2D
@export var victoryScreen: CanvasLayer
var victoryShown = false  

func showVictoryScreen():
	if victoryShown:
		return
	
	
	var enemies = get_tree().get_nodes_in_group("enemy")
	
	if enemies.size() == 0:
		victoryScreen.show()
		victoryShown = true
		print("Victory! No enemies left.")
	else:
		print("Enemies remaining: ", enemies.size())

func _process(delta: float) -> void:
	showVictoryScreen()
