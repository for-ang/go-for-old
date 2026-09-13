extends Node2D

var intarget = 0
var bullets = 3
var score = 0 

func _ready():
	$crosshair.position = Vector2(80,72)
	
func _process(_delta: float):
	if bullets > 0:
		if Input.is_action_just_pressed("A"):
			score += intarget
			bullets -= 1 
	$ScoreLabel.text = str(score)
	$BulletsLabel.text = str(bullets)


func _on_area_2d_body_entered(_body: Node2D):
	intarget += 1
func _on_area_2d_body_exited(_body: Node2D):
	intarget -= 1 

func _on_mid_body_entered(_body: Node2D):
	intarget += 1
func _on_mid_body_exited(_body: Node2D):
	intarget -= 1

func _on_outer_body_entered(_body: Node2D):
	intarget += 1
func _on_outer_body_exited(_body: Node2D):
	intarget -= 1 
