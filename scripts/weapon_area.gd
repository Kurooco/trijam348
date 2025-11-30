extends Area2D

@export var damage = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if(area is HurtArea):
		area.hit(damage)
		area.invicibility_ended.connect(hurt_again.bind(area))

func hurt_again(area):
	if(is_instance_valid(area)):
		if(area in get_overlapping_areas()):
			area.hit(damage)
		else:
			area.invicibility_ended.disconnect(hurt_again)
