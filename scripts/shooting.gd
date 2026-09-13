extends Node2D

var intarget = 0

func _ready():
	$crosshair.position = Vector2(80,72)

func _process(delta: float) -> void:
	print(intarget)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	intarget = 1

func _on_area_2d_body_exited(body: Node2D) -> void:
	intarget = 0 
