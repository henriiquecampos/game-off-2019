extends KinematicBody2D

var direction = Vector2.ZERO
var magnitude = 200

export(float, EASE) var amount = 1.0


func _input(event):
	if event is InputEventMouseMotion and Input.is_action_pressed("click"):
		direction = (global_position - get_global_mouse_position()).normalized()
		$Line.update()
		
	if event.is_action_pressed("click"):
		$Line.show()
	elif event.is_action_released("click"):
		leap()
		$Line.hide()


func leap():
	var distance = global_position.distance_to(get_global_mouse_position())
	var ratio = distance/magnitude
	ratio = clamp(ratio, 0.0, 1.0)
	var target_position = global_position + (direction * (200 * ratio))
	$Tween.interpolate_property(self, "global_position", global_position,
			target_position, 0.5, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	$Tween.start()


