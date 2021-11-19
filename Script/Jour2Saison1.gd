extends Node2D

onready var vent = $Vent

var clic_possible = bool(false)
var son_joue = bool(false)

var liste_sons = [
	preload("res://SD/Vent1.wav"),
	preload("res://SD/Vent2.wav")
]

func _ready():
	clic_possible = false
	son_joue = false
	_vent_random(liste_sons)

func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().quit()
	if event is InputEventMouseButton :
		if event.button_index == BUTTON_LEFT and event.pressed and clic_possible and !son_joue :
			vent.play()
			son_joue = true

func _on_Area2D_mouse_entered():
	clic_possible = true

func _on_Area2D_mouse_exited():
	clic_possible = false

func _vent_random(s: Array) -> void :
	randomize()
	s.shuffle()
	vent.stream = liste_sons.front()

func _on_Vent_finished():
	_vent_random(liste_sons)
	son_joue = false
