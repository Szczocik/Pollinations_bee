extends Area2D

export (int) var speed = 50


func _physics_process(delta):
	global_position.y += speed * delta
