extends Node2D

var started = 0 

func _process(_float):
	if Input.is_action_just_pressed("A") and started == 0:
		$TEMPSTART.hide()
		started = 1
		var scene = preload("res://scenes/running.tscn")
		var instance = scene.instantiate()
		add_child(instance)
		
func load_boxing():
	var scene = preload("res://scenes/boxing.tscn")
	var instance = scene.instantiate()
	add_child(instance)
