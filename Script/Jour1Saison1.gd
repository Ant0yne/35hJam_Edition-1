extends Node2D

onready var nuage = $Nuage

var nuage_visible = true

func _ready():
	nuage_visible = true

func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().quit()

func _process(delta):
	if nuage.position.x > -305 :
			nuage.position.x -= 0.05
	if nuage.position.x <= -305 :
			nuage.position.x = 906
