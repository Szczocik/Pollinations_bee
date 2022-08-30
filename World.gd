extends Node2D


onready var player = $Player
onready var Stripes = $Stripes.get_children()
onready var pollination_effect = $EffectsLayer/Pollination

var Flower = load("res://Flower/Flower.tscn")
var Flower_curr = []


func _ready():
	MusicController.play_music()
	$MusicTimer.start()
	 
func _process(delta):
	$CountdownLabel.text = str(int($CountdownTimer.time_left) +1)

func _on_MusicTimer_timeout():
	MusicController.turn_down_volume()
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	get_tree().call_group("flower", "light_on")
	get_tree().call_group("flower", "stop_move")
	
func _on_CountdownTimer_timeout():
	$Player.block = true
	get_tree().call_group("player", "pollition_effect")
	$Player/ShakeAnimation.play("shake")
	
	var curr = curr_strip()
	if curr >= 0:
		print(curr, ", ", Stripes[curr])
		Flower_curr.append(Stripes[curr])
		print(Flower_curr)
		
	$CountdownLabel.visible = false
	MusicController.reset_volume()
	get_tree().call_group("flower", "light_off")
	get_tree().call_group("flower", "start_move")
	$Player.block = false

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
	

