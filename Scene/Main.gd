extends Node2D

onready var Arbres = $Arbres
onready var ArrierePlan = $"Arriere Plan"

func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().quit()

func _process(delta):
	Arbres.position.x -= 0.1
	Arbres.position.y += 0.01
	ArrierePlan.position.x -= 0.01
	ArrierePlan.position.y += 0.001
