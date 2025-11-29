extends Area2D
class_name HurtArea

@export var health_component : Node
@export var inv_time = 1.0

signal invicibility_ended
signal hurt(amount)

var invincible = false
@onready var invincible_timer = $InvincibleTimer

func _ready():
	invincible_timer.wait_time = inv_time

func hit(amount: float):
	if(!invincible):
		hurt.emit(amount)
		health_component.change_health(-amount)
		if(inv_time > 0):
			invincible = true
			$InvincibleTimer.start()

func _on_invincible_timer_timeout():
	invincible = false
	invicibility_ended.emit()
