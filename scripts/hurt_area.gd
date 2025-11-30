extends Area2D
class_name HurtArea

@export var health_component : Node
@export var always_hurt_on_pass = false

signal invicibility_ended
signal hurt(amount)

var invincible = false
var disabled = false
@onready var invincible_timer = $InvincibleTimer
	

func hit(amount: float):
	if(!invincible && !disabled):
		print_debug(name)
		hurt.emit(amount)
		health_component.change_health(-amount)
		if($InvincibleTimer.wait_time > 0):
			invincible = !always_hurt_on_pass
			$InvincibleTimer.start()

func _on_invincible_timer_timeout():
	invincible = false
	invicibility_ended.emit()
