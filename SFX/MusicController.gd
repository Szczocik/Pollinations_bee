extends Node

var music = load("res://SFX/Chiptune_Adventures_1.ogg")
 
func _ready():
	pass
	
func play_music():
	$Music.stream = music
	$Music.play()
	
