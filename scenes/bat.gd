extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -500.0
const MOVE_TIME = .5

var time = 0
var dir = 0
var move_vel = Vector2.ZERO

func _physics_process(delta):
	time += delta
	if(time >= MOVE_TIME):
		time = 0
		dir = randf()*PI*2
		move_vel = Vector2.from_angle(dir)*SPEED
	
	if(is_on_wall()):
		move_vel.x *= -1
	if(is_on_ceiling() || is_on_floor()):
		move_vel.y *= -1
	
	velocity = move_vel

	move_and_slide()
	


func _on_health_component_killed():
	queue_free()
