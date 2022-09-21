extends Node2D

onready var gui_layer = $GUILayer
onready var hud = $GUILayer/HUD
onready var player = $Player
onready var pollination_effect = $EffectsLayer/Pollination
export (PackedScene) var flower = preload("res://Flower/Flower2.tscn")

var Stripes = []
var Flowers = []

func _ready():
	for child in $Stripes.get_children():
		if "Strip" in child.get_name():
			Stripes.append(child)
	for stripe in Stripes:
		var has_flower = false
		for sch in stripe.get_children():
			if "Flower" in sch.get_name():
				Flowers.append(sch)
				has_flower = true
		if not has_flower:
			Flowers.append(null)
	MusicController.play_music()
	$MusicTimer.start()
	hud.update_flowers($Player.score)
	hud.update_worms($Player.target)
	
func _process(_delta):
	$CountdownLabel.text = str(int($CountdownTimer.time_left) +1)
	hud.update_flowers($Player.score)
	hud.update_worms($Player.target)
	
func _on_MusicTimer_timeout():
	MusicController.turn_down_volume()
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	get_tree().call_group("flower", "light_on")
	get_tree().call_group("flower", "stop_move")
	
func _on_CountdownTimer_timeout():
	$Player.block = true
	$CountdownLabel.visible = false
	$StopTimer.start()
		
func _on_StopTimer_timeout():
	$Player.back = true
	$RestartMusicTimer.start()
	
func _on_RestartMusicTimer_timeout():
	$Player.block = false
	
	get_tree().call_group("flower", "light_off")
	MusicController.reset_volume()
	get_tree().call_group("flower", "start_move")
	$MusicTimer.start()

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
	
func get_flower():
	var curr = curr_strip()
	return Flowers[curr]

func spawn_worm(WormScene, location):
	var worm = WormScene.instance()
	add_child(worm)
	worm.global_position = location

func _on_DeathZone_area_entered(area):
	area.queue_free()
