extends Node

@export var max_health = 100.0
@export var drain = 0.0
var health

signal killed

func _ready():
	health = max_health

func change_health(amount):
	health += amount
	if(health <= 0):
		killed.emit()
		health = 0
	health = min(max_health, health)

func _process(delta):
	health -= drain*delta
