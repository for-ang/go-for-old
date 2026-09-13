extends CharacterBody2D

const SPEED = 200
var shaketarget = Vector2i(80,72)

func _physics_process(_delta: float):
	velocity = position.direction_to(shaketarget) * SPEED
	if position.distance_to(shaketarget) > 10:
		move_and_slide()

		#dont look at this
		#it works but its disgusting
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


func _on_shake_timer_timeout():
	shaketarget = Vector2i(randi_range(20,140),randi_range(5,125))
