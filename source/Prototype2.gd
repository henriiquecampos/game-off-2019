extends Node2D

onready var player = $Player

func _ready():
	for leapable in get_tree().get_nodes_in_group("leapable"):
		leapable.connect("input_event", self, "_on_leapable_input_event", [leapable])

func _on_leapable_input_event(viewport, event, shape_idx, leapable):
	if not event.is_action_pressed("click"):
		return
	player.leap_to(leapable)
