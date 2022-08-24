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
	# get_tree().call_group("flower", "start_move")


func _on_Strip_area_entered(area): return area.position
func _on_Strip2_area_entered(area): return area.position	
func _on_Strip3_area_entered(area): return area.position	
func _on_Strip4_area_entered(area): return area.position
func _on_Strip5_area_entered(area): return area.position
func _on_Strip6_area_entered(area): return area.position
func _on_Strip7_area_entered(area): return area.position
func _on_Strip8_area_entered(area): return area.position
func _on_Strip9_area_entered(area): return area.position


func _on_Strip_body_entered(body):
	print(body.position)
	return body.position




