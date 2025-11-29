extends Sprite2D

var fire : Node
var move_toward_fire = false
var move_ratio = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	fire = get_tree().get_nodes_in_group("fire")[0]
	var move_tween = create_tween()
	move_tween.tween_property(self, "position", position+Vector2(randf_range(-100, 100), randf_range(-100, 100)), 1).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	move_tween.finished.connect(start_move)

func start_move():
	move_toward_fire = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(move_toward_fire):
		move_ratio += delta
		var dist = fire.global_position - global_position
		global_position += dist*move_ratio
		if(move_ratio >= 1 || dist.length() < 20):
			fire.heal(10)
			queue_free()
