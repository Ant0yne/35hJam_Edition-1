extends Node2D

func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().quit()

func _on_Commencer_button_up():
	get_tree().change_scene("res://Scene/Main.tscn")

func _on_Quitter_button_up():
	get_tree().quit()
