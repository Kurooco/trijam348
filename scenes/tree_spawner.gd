extends Path2D

var spawned_trees = 0
signal trees_spawned
signal trees_removed

func spawn_trees():
	for i in range(randi_range(3, 10)):
		var tree : Node = load("res://scenes/tree_2.tscn").instantiate()
		$Point.progress_ratio = randf()
		tree.global_position = $Point.global_position
		tree.tree_exiting.connect(remove_tree)
		get_tree().current_scene.call_deferred("add_child",tree)
		spawned_trees += 1
		await get_tree().create_timer(.1).timeout
	trees_spawned.emit()

func remove_tree():
	spawned_trees -= 1
	if(spawned_trees <= 0):
		trees_removed.emit()
