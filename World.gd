extends Node2D

#signal flower_on(flower)
#signal player_on(position)

onready var player = $Player
onready var Stripes = $Stripes.get_children()
onready var pollination_effect = $EffectsLayer/Pollination

var Flower = load("res://Flower/Flower.tscn")



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
	#$Player.block = true
	get_tree().call_group("player", "pollition_effect")
	$Player/ShakeAnimation.play("shake")
	
	var curr = curr_strip()
	if curr >= 0:
		print(curr, ", ", Stripes[curr])
		
	$CountdownLabel.visible = false
	MusicController.reset_volume()
	get_tree().call_group("flower", "light_off")
	get_tree().call_group("flower", "start_move")
	#$Player.block = false

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
	



func _on_Strip_body_entered(Flower):
	pass



func _on_Strip_area_entered(flower):
	pass


func _on_Strip1_area_entered(area):
	pass # Replace with function body.


func _on_Strip2_area_entered(area):
	pass # Replace with function body.


func _on_Strip3_area_entered(area):
	pass # Replace with function body.


func _on_Strip4_area_entered(area):
	pass # Replace with function body.


func _on_Strip5_area_entered(area):
	pass # Replace with function body.


func _on_Strip6_area_entered(area):
	pass # Replace with function body.


func _on_Strip7_area_entered(area):
	pass # Replace with function body.


func _on_Strip8_area_entered(area):
	pass # Replace with function body.


func _on_Strip9_area_entered(area):
	pass # Replace with function body.
