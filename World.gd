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
	 


func _on_MusicTimer_timeout():
	MusicController.turn_down_volume()
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	get_tree().call_group("flower", "light_on")
	get_tree().call_group("flower", "stop_move")
	

func _on_CountdownTimer_timeout():
	get_tree().call_group("player", "pollition_effect")
	$Player/ShakeAnimation.play("shake")
	
	
	
	$CountdownLabel.visible = false
	MusicController.reset_volume()
	get_tree().call_group("flower", "light_off")
	get_tree().call_group("flower", "start_move")

	
func _process(delta):
	$CountdownLabel.text = str(int($CountdownTimer.time_left) +1)

func check_flower():
	var player_strip = $Player.strip
	var flower = Flower
	var flower_position = emit_signal("flower_on", flower, global_position)
	if flower and player: 
		pass	


func _on_Strip_body_entered(Flower):
	pass



func _on_Strip_area_entered(flower):
	if flower and Player:
		emit_signal("flower_on", flower, global_position)
		#print(flower.global_position)


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
