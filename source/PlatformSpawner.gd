extends Position2D

export(PackedScene) var platform_scene
export(float) var min_wait_time = 1.0
export(float) var max_wait_time = 5.0 


func _ready():
	randomize()


func spawn():
	var platform = platform_scene.instance()
	platform.global_position = global_position
	
	get_parent().add_child(platform)
	reset_timer()


func reset_timer():
	$Timer.wait_time = rand_range(min_wait_time, max_wait_time)
	$Timer.start()
