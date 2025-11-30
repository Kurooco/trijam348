extends Sprite2D

func spawn():
	var tree : Node = load("res://scenes/bat.tscn").instantiate()
	tree.global_position = global_position
	get_tree().current_scene.call_deferred("add_child",tree)
