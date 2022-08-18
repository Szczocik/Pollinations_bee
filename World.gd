extends Node2D


func _ready():
	MusicController.play_music()
	$MusicTimer.start()
	

		
	
	

func _on_MusicTimer_timeout():
	MusicController.turn_down_volume()


func _on_MusicReset_timeout():
	MusicController.reset_volume()



func _on_MusicPause_timeout():
	pass # Replace with function body.
