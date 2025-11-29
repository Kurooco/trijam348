extends "res://scripts/hurt_area.gd"


func _on_health_component_killed():
	hide()
	disabled = true
	await get_tree().create_timer(1).timeout
	queue_free()


func _on_hurt(amount):
	for i in range(10):
		var new_wood = load("res://scenes/wood_piece.tscn").instantiate()
		new_wood.position = position
		get_tree().current_scene.add_child(new_wood)
