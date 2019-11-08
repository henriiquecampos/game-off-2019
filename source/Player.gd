extends Area2D

onready var shape = $Shape.shape
onready var initial_radius = shape.radius
onready var tween = $Tween

func _physics_process(delta):
	translate(Vector2.ZERO)


func _ready():
	tween_shape()


func tween_shape():
	tween.interpolate_property(shape, "radius", initial_radius,
		10, 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()


func reset_shape():
	tween.stop(shape, "radius")
	shape.radius = initial_radius


func leap_to(leaping_area):
	if not leaping_area in get_overlapping_areas():
		return
	
	var target_position = leaping_area.global_position
	leaping_area.monitorable = false
	
	tween.interpolate_property(self, "global_position", global_position,
			target_position, 0.25, Tween.TRANS_BACK, Tween.EASE_IN)


func _on_Tween_tween_completed(object, key):
	if object == self and key == ":global_position":
		reset_shape()
		tween_shape()
	elif object == shape:
		get_tree().quit()
