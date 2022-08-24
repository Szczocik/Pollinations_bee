extends Node2D

onready var player = $Player


func _ready():
	MusicController.play_music()
	$MusicTimer.start()
	 


func _on_MusicTimer_timeout():
	MusicController.turn_down_volume()
	$MusicReset.start()
	get_tree().call_group("flower", "light")
	get_tree().call_group("flower", "stop_move")
	get_tree().call_group("player", "detect_flower")
	

func _on_MusicReset_timeout():
	MusicController.reset_volume()
	get_tree().call_group("flower", "light_off")
	get_tree().call_group("flower", "start_move")


func check_player():
	pass
		
