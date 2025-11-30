extends "res://scripts/hurt_area.gd"

func _ready():
	var t : Tween = create_tween()
	t.tween_property($Sprite2D, "scale", Vector2(1, 1), 1).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)

func _on_health_component_killed():
	hide()
	disabled = true
	await get_tree().create_timer(1).timeout
	queue_free()


func _on_hurt(amount):
	for i in range(3):
		var new_wood = load("res://scenes/wood_piece.tscn").instantiate()
		new_wood.position = position
		get_tree().current_scene.add_child(new_wood)
