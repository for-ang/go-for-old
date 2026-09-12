extends Node2D

func _ready():
	$crosshair.position = Vector2(80,72)

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
