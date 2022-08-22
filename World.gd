extends Node2D
onready var player = $Player
onready var Flouer = preload("res://Flouer/Flouer.tscn")

func _ready():
	MusicController.play_music()
	$MusicTimer.start()
		

func Pollinations():
	var flouer = Flouer.instance() 
	
	
	

func _on_MusicTimer_timeout():
	MusicController.turn_down_volume()
	$MusicReset.start()
	get_tree().call_group("flouer", "light")
	get_tree().call_group("flouer", "stop_move")
	#get_tree().call_group("player", "move_to_flouer")
	

func _on_MusicReset_timeout():
	MusicController.reset_volume()
	get_tree().call_group("flouer", "light_off")
	get_tree().call_group("flouer", "start_move")
