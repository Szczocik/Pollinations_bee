extends Node2D
onready var music = $MusicTimer
var music_timer = true

func _ready():
	MusicController.play_music()
	if music.set_timer_process_mode(1):
		MusicController.play_music()
		music_timer = false
	else:
		MusicController.turn_down_volume()
		music_timer = true
		
