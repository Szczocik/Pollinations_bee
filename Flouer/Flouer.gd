extends Area2D


onready var light = $Light2D

func light():
	light.energy = 1.55
	
func light_off():
	light.energy = 0
