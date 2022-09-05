extends Node2D

export (PackedScene) var World_scene


onready var player = $Player
onready var Stripes = $Stripes.get_children()
onready var player2 = $Player2
onready var pollination_effect = $EffectsLayer/Pollination
export (PackedScene) var flower = preload("res://Flower/Flower.tscn")


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
	var min_flower = get_closest_flower()
	if curr >= 0:
		print(min_flower)
		print(curr, ", ", Stripes[curr])
		Flower_curr.push_front(Stripes[curr])
		Flower_curr.remove(1)
	
	
		
	$CountdownLabel.visible = false
	$Player.block = true
	get_closest_flower()
	# get_tree().call_group("flower", "light_off")
	get_tree().call_group("player", "pollition_effect")
	$Player/ShakeAnimation.play("shake")
	
	MusicController.reset_volume()
	
	# get_tree().call_group("flower", "start_move")
	
func get_closest_flower():
	var min_dist = 99999
	var min_flower
	var flowers = get_tree().get_nodes_in_group("flower")
	for flower in flowers:
		var dist = $Player.position.distance_to(flower.position)
		if (dist < min_dist):
			min_dist = dist
			min_flower = flower
	print(min_flower)
	return min_flower
		
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
	
