extends Node2D

var jour_nuit
var scene_jour = [
	preload("res://Scene/Jour1Saison1.tscn"),
	preload("res://Scene/Jour2Saison1.tscn")
]

var scene_nuit = [
	preload("res://Scene/Nuit1Saison1.tscn"),
	preload("res://Scene/Nuit2Saison1.tscn")
]

func _ready():
	jour_nuit = OS.get_datetime(false)
	print(jour_nuit)

#func _process(delta):
#	if jour_nuit["hour"] >= 6 && jour_nuit["hour"] < 18:
#		_jour()
#	if jour_nuit["hour"] >= 18 && jour_nuit["hour"] <= 23:
#		_nuit()
#	if jour_nuit["hour"] >= 00 && jour_nuit["hour"] < 6:
#		_nuit()
	
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
	randomize()
	if scene_nuit.empty():
		return
	else : 
		var scene_random = randi() % scene_nuit.size()
		var scene = scene_nuit[scene_random].instance()
		add_child(scene)
		scene_nuit.clear()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_ESCAPE :
			get_tree().quit()
		else:
			_transition()
	if event is InputEventMouseButton and event.pressed:
		_transition()

func _transition():
	if jour_nuit["hour"] >= 6 && jour_nuit["hour"] < 18:
		_jour()
	if jour_nuit["hour"] >= 18 && jour_nuit["hour"] <= 23:
		_nuit()
	if jour_nuit["hour"] >= 00 && jour_nuit["hour"] < 6:
		_nuit()
