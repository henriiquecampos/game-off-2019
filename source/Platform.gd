extends StaticBody2D


func _physics_process(delta):
	translate((get_parent().speed * delta) * Vector2.LEFT)
	
