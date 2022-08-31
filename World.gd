extends Node2D

export (PackedScene) var World_scene

onready var player = $Player
onready var Stripes = $Stripes.get_children()
onready var pollination_effect = $EffectsLayer/Pollination


var Flower_curr = []


func _ready():
	MusicController.play_music()
	$MusicTimer.start()
	 
func _process(_delta):
	$CountdownLabel.text = str(int($CountdownTimer.time_left) +1)

func _on_MusicTimer_timeout():
	MusicController.turn_down_volume()
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	get_tree().call_group("flower", "light_on")
	get_tree().call_group("flower", "stop_move")
	
func _on_CountdownTimer_timeout():
	
	var curr = curr_strip()
	if curr >= 0:
		
		print(curr, ", ", Stripes[curr])
		Flower_curr.push_front(Stripes[curr])
		Flower_curr.remove(1)
		
		
	$CountdownLabel.visible = false
	$Player.block = true
	get_tree().call_group("flower", "light_off")
	get_tree().call_group("player", "pollition_effect")
	$Player/ShakeAnimation.play("shake")
	
	#MusicController.reset_volume()
	
	#get_tree().call_group("flower", "start_move")
	
	
func _on_StopTimer_timeout():
	pass

func curr_strip():
	var no = -1
	for strip in Stripes:
		no += 1
		var cshape = strip.get_node("CollisionShape2D")
		var shape = cshape.get_shape()
		if player.position.x < (cshape.position.x - shape.get_extents().x) + shape.get_extents().x * 2:
			break
		if no == Stripes.size() - 1:
			no = -1
	return no
	

	




