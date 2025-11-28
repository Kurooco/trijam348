extends Node2D

@export var collision_node : Node
@export var texture : Texture

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
