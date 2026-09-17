extends Node2D

var prog = 0 
var tilt = 0
var countdown = 3 

@onready var player: Sprite2D = $Player
@onready var finish: Label = $Finish
@onready var over: Label = $Over
@onready var count: Label = $Count
@onready var game: Node2D = $"."



func _ready():
	player.position.x = 80
	finish.hide()
	over.hide()

func _physics_process(_delta: float):
	count.text = str(countdown)
	if countdown == 0: 
		count.hide()
		#run (w/ sprite movement)
		if Input.is_action_just_pressed("A"):
			prog += 1 
			player.position.y -= 4
		if Input.is_action_just_released("A"):
			player.position.y += 4
	
	#manual tilt
	if Input.is_action_just_pressed("LEFT"):
		tilt_left()
	if Input.is_action_just_pressed("RIGHT"):
		tilt_right() 

func _process(_float):
	#game over conditions
	if prog >= 50:
		player.hide()
		finish.show()
	if tilt <= -4 or tilt >= 4:
		player.hide()
		over.show()

#tilt direction functions
func tilt_left():
	if countdown == 0:
		player.position.x -= 10
		player.rotation_degrees -= 10
		tilt -= 1
func tilt_right():
	if countdown == 0:
		player.position.x += 10
		player.rotation_degrees += 10
		tilt += 1 

#automatic tilt
func _on_tilt_timer_timeout():
	var rand = randi_range(0,1)
	if tilt == 0 and rand == 0 or tilt <= -1:
		tilt_left()
	elif tilt == 0 and rand == 1 or tilt >= 1:
		tilt_right()

func _on_start_timer_timeout():
	if countdown > 0:
		countdown -= 1 
	
