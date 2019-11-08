extends KinematicBody2D

const FLOOR_NORMAL = Vector2.UP

export(float) var gravity = 3000.0
export(float) var jump_strength = 1200.0

var linear_velocity = Vector2.ZERO
var coyote_time = false

func _physics_process(delta):
	linear_velocity.y += gravity * delta
	linear_velocity = move_and_slide(linear_velocity, FLOOR_NORMAL)


func jump():
	if is_on_floor():
		linear_velocity.y = -jump_strength 


func cancel_jump():
	if linear_velocity.y < 0.0 and not is_on_floor():
		linear_velocity.y = 0.0
