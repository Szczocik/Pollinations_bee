extends Node2D

signal flower_on(flower)
signal player_on(position)

onready var player = $Player
onready var Stripes = $Stripes.get_children()
onready var pollination_effect = $EffectsLayer/Pollination

var flower = load("res://Flower/Flower.tscn")

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
	get_tree().call_group("player", "_move_to_mouse")
	$Player/ShakeAnimation.play("shake")
	
	$CountdownLabel.visible = false
	MusicController.reset_volume()
	get_tree().call_group("flower", "light_off")
	get_tree().call_group("flower", "start_move")

	
	
func _process(delta):
	$CountdownLabel.text = str(int($CountdownTimer.time_left) +1)

func check_player():
	var strip = []
	for player in Stripes:
		pass


func _on_Strip_body_entered(player):
	if player:
		emit_signal("flower_on", global_position)
		print(player.global_position)
	
func _on_Strip1_body_entered(body): return body
func _on_Strip2_body_entered(body): return body
func _on_Strip3_body_entered(body): return body
func _on_Strip4_body_entered(body): return body
func _on_Strip5_body_entered(body): return body
func _on_Strip6_body_entered(body): return body
func _on_Strip7_body_entered(body): return body
func _on_Strip8_body_entered(body): return body
func _on_Strip9_body_entered(body): return body



func _on_Strip_area_entered(flower):
	if flower:
		emit_signal("flower_on", flower, global_position)
		print(flower.global_position)
