extends Node2D

onready var music = $BGM
onready var player = $Player
onready var bgm_timer = $BGM/BGM_Timer


func _ready():
	stop_music()
	

func stop_music():
	pass
	#pause_mode.stop	
