extends Node

var music = load("res://SFX/Chiptune_Adventures_1.ogg")
 
func _ready():
	pass
	
func play_music():
	$Music.stream = music
	$Music.play()
	
func turn_down_volume():
	$Music.volume_db = -12
	
func reset_volume():
	$Music.volume_db = 0
