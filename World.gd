extends Node2D

func _ready():
	MusicController.play_music()
	$MusicTimer.start() 


func _on_MusicTimer_timeout():
	MusicController.turn_down_volume()
	$MusicReset.start()
	get_tree().call_group("flower", "light")
	get_tree().call_group("flower", "stop_move")
	

func _on_MusicReset_timeout():
	MusicController.reset_volume()
	get_tree().call_group("flower", "light_off")
	get_tree().call_group("flower", "start_move")


func _on_Strip_body_entered(body):
	pass
