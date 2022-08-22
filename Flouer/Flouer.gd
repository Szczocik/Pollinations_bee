extends KinematicBody2D


onready var light = $Light2D

func light():
	light.energy = 0.4	
	
func light_off():
	light.energy = 0

func stop_move():
	$AnimationPlayer.stop(true)
	
func start_move():
	$AnimationPlayer.play("move")
	
