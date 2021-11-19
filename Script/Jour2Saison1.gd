extends Node2D

var clic_possible = bool(false)

func _ready():
	clic_possible = false

func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().quit()

func _on_Area2D_mouse_entered():
	clic_possible = true

func _on_Area2D_mouse_exited():
	clic_possible = false
