extends Node2D

onready var nuage = $Nuage
onready var sonFeuilles = $RanSoundContainer

var nuage_visible = bool(true)
var clique_possible = bool(false)

func _ready():
	nuage_visible = true
	clique_possible = false

func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().quit()
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and clique_possible == true :
			sonFeuilles.play()

func _process(delta):
	if nuage.position.x > -305 :
			nuage.position.x -= 0.05
	if nuage.position.x <= -305 :
			nuage.position.x = 906

func _on_Zone_Clicable_mouse_entered():
	clique_possible = true

func _on_Zone_Clicable_mouse_exited():
	clique_possible = false
