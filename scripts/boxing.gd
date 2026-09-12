extends Node2D

@onready var init_timer: Timer = $InitTimer
@onready var move_timer: Timer = $MoveTimer
@onready var label: Label = $Label

var player_health = 3
var opp_health = 3 
var move = 0

func _ready():
	$Win.hide()
	init_timer.start()
	
func _process(_delta: float):
	$HealthLabel.text = str(player_health)
	$OppHealthLabel.text = str(opp_health)
	if player_health == 0:
		queue_free()
	if opp_health == 0:
		label.hide()
		$Win.show()
	
func _on_init_timer_timeout():
	move = randi_range(1,3)
	label.text = str(move)
	move_timer.start()

func _on_move_timer_timeout():
	if move == 1:
		if Input.is_action_pressed("B"):
			label.text = "BLOCKED!"
		else:
			label.text = "YEOWCH!"
			player_health -= 1
	elif move == 2:
		if Input.is_action_pressed("DOWN"):
			label.text = "DODGED!"
		else:
			label.text = "OWIE!"
			player_health -= 1
	elif move == 3:
		if Input.is_action_pressed("A"):
			label.text = "HIT!!"
			opp_health -= 1 
		else:
			label.text = "WAHH!"
			player_health -= 1 
	init_timer.start()
