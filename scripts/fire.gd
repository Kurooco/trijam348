extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -700.0

var y_rebound_vel = 0
var x_rebound_vel = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 2
		y_rebound_vel = velocity.y
	elif(not Input.is_action_pressed("down_f")):
		velocity.y = -abs(y_rebound_vel*.8)
	else:
		y_rebound_vel = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump_f"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left_f", "right_f")
	if direction:
		velocity.x += direction * SPEED
	#else:
	#	velocity.x += move_toward(velocity.x, 0, SPEED)
	
	velocity.x = lerp(velocity.x, 0.0, 1 - pow(.04, delta))
	if(!is_on_wall()):
		x_rebound_vel = velocity.x
	else:
		velocity.x = -x_rebound_vel*.9
	
	move_and_slide()
