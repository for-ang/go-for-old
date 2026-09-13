extends CharacterBody2D

const SPEED = 100.0

func _physics_process(_delta: float):
				#REDO THIS
				#ITS BAD
	var directionx := Input.get_axis("LEFT", "RIGHT")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var directiony := Input.get_axis("UP", "DOWN")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_shake_timer_timeout() -> void:
	position = Vector2i(randi_range(20,140),randi_range(5,125))
