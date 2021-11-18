extends Node2D

var jour_nuit
var scene_jour = [
	preload("res://Scene/Jour1Saison1.tscn"),
	preload("res://Scene/Jour2Saison1.tscn")
]

func _ready():
	jour_nuit = OS.get_datetime(false)
	print(jour_nuit)

func _process(delta):
	if jour_nuit["hour"] >= 6 && jour_nuit["hour"] < 18:
		_jour()
	if jour_nuit["hour"] >= 18 && jour_nuit["hour"] <= 23:
		_nuit()
	if jour_nuit["hour"] >= 00 && jour_nuit["hour"] < 6:
		_nuit()
	
func _jour():
	randomize()
	if scene_jour.empty():
		return
	else : 
		var scene_random = randi() % scene_jour.size()
		var scene = scene_jour[scene_random].instance()
		add_child(scene)
		scene_jour.clear()
	
func _nuit():
	get_tree().change_scene("res://Scene/Nuit1Saison1.tscn")

func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().quit()

func _on_Commencer_button_up():
	get_tree().change_scene("res://Scene/Jour1Saison1.tscn")

func _on_Quitter_button_up():
	get_tree().quit()
