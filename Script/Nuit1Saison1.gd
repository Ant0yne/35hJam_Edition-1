extends Node2D

onready var craquement = $Craquement

var clique_possible = bool(false)
var son_joue = bool(false)

var liste_sons = [
	preload("res://SD/Craquement1.wav"),
	preload("res://SD/Craquement2.wav"),
	preload("res://SD/Craquement3.wav")
]

func _ready():
	clique_possible = false
	son_joue = false
	_son_craquement_random(liste_sons)

func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().quit()
	if event is InputEventMouseButton :
		if event.button_index == BUTTON_LEFT and event.pressed and clique_possible and !son_joue :
			craquement.play()
			son_joue = true

func _on_Area2D_mouse_entered():
	clique_possible = true

func _on_Area2D_mouse_exited():
	clique_possible = false

func _son_craquement_random(s:Array) -> void:
	randomize()
	s.shuffle()
	craquement.stream = liste_sons.front()

func _on_Craquement_finished():
	_son_craquement_random(liste_sons)
	son_joue = false
