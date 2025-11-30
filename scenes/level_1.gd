extends Node2D

@export var collision_node : Node
@export var texture : Texture

var last_tree_spanwer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in collision_node.get_children():
		var col : CollisionPolygon2D = child.get_child(0)
		var shape : Polygon2D = Polygon2D.new()
		shape.polygon = col.polygon
		shape.texture = texture
		shape.position = col.position
		shape.texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
		collision_node.add_child(shape)
	var s = get_tree().get_nodes_in_group("tree_spawner")[0]
	s.spawn_trees()
	s.trees_removed.connect(new_trees.bind(s))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func new_trees(ps):
	ps.trees_removed.disconnect(new_trees)
	var ts_list = get_tree().get_nodes_in_group("tree_spawner")
	if(is_instance_valid(ps)):
		ts_list.erase(ps)
	var s = ts_list.pick_random()
	s.spawn_trees()
	s.trees_removed.connect(new_trees.bind(s))
	await s.trees_spawned


func _on_enemy_timer_timeout():
	var s_list = get_tree().get_nodes_in_group("enemy_spawner")
	var s = s_list.pick_random()
	s.spawn()
