extends Node2D

onready var nuage = $Nuage
onready var sonFeuilles = $"Son Feuilles"

var nuage_visible = bool(true)
var clique_possible = bool(false)
var son_joue = bool(false)

var liste_sons = [
	preload("res://SD/Son feuilles.wav"),
	preload("res://SD/Son feuilles2.wav"),
	preload("res://SD/Son feuilles3.wav"),
	preload("res://SD/Son feuilles4.wav"),
	preload("res://SD/Son feuilles5.wav")
]

func _ready():
	nuage_visible = true
	clique_possible = false
	son_joue = false
	_sons_feuille_random(liste_sons)
	
func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().quit()
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and clique_possible == true and son_joue == false :
			sonFeuilles.play()
			son_joue = true

func _process(delta):
	if nuage.position.x > -305 :
			nuage.position.x -= 0.05
	if nuage.position.x <= -305 :
			nuage.position.x = 906

func _on_Zone_Clicable_mouse_entered():
	clique_possible = true

func _on_Zone_Clicable_mouse_exited():
	clique_possible = false
	
func _sons_feuille_random(s:Array) -> void:
	randomize()
	s.shuffle()
	sonFeuilles.stream=liste_sons.front()

func _on_Son_Feuilles_finished():
	_sons_feuille_random(liste_sons)
	son_joue = false
