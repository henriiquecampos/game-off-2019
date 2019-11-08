extends Node2D

func _draw():
	var distance = global_position.distance_to(get_global_mouse_position())
	var ratio = distance/get_parent().magnitude
	var mouse_direction = (get_global_mouse_position() - global_position).normalized()
	ratio = clamp(ratio, 0.0, 1.0)
	draw_line(Vector2.ZERO, mouse_direction * (200 * ratio), Color.white, 20)
