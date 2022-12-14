extends KinematicBody2D
class_name Player

export (int) var min_move_speed = 200
export (int) var max_move_speed = 350
export (int) var stop_distance = 20
export (int) var score = 0
export (int) var target = 0 
export (PackedScene) var flower = preload("res://Flower/Flower.tscn")

var block = false
var back = false
var world = true

func _physics_process(_delta):
	if block:
		_look_at_flower()
		_move_to_flower()
		return
	if back:
		_look_at_flower()	
		_move_back()
		return
	process_mouse()

func process_mouse():
	var target_mouse = get_viewport().get_mouse_position().x
	var bee_width = get_node("CollisionShape2D").shape.extents.x
	var viewport_width = get_viewport().size.x
	if position.x < target_mouse:
		if not test_move(Transform2D(transform), Vector2(1,0)):
			position.x = min(target_mouse, viewport_width - bee_width)
	elif position.x > target_mouse:
		if not test_move(Transform2D(transform), Vector2(-1,0)):
			position.x = max(target_mouse, bee_width)
			
func	_look_at_flower():
	flower = get_parent().get_flower()
	if flower != null:
		look_at(flower.position)
		rotation_degrees = rotation_degrees + 90
	else:
		# Brak kwiatka
		pass
		
func _move_to_flower():
	flower = get_parent().get_flower()
	if flower != null:
		if position.distance_to(flower.position) > stop_distance:
			var direction = flower.position - position
			var normalized_direction = direction.normalized()
			var direction_distance = direction.length()
			move_and_slide(normalized_direction * max(min_move_speed,min(max_move_speed, direction_distance)))
			_on_Timer_timeout()
	else:
		# Brak kwiatka
		pass

func _move_back():
	flower = get_parent().get_flower()
	if flower != null:
		var pos = Vector2(global_position.x, 960)
		if position.distance_to(pos) > stop_distance:
			var direction = pos - position
			var normalized_direction = direction.normalized()
			var direction_distance = direction.length()
			move_and_slide(normalized_direction * max(min_move_speed,min(max_move_speed, direction_distance)))
	else:
		# Brak kwiatka
		pass

func add_score():
	score += 1
	if score >= 5:
		$ChangeSceneTimer.start()
	if score >= 7:
		$MenuTimer.start()	
		
func down_score():
	score -= 1
	if score >= 0:
		$MenuTimer.start()
		
func add_point_target():
	target += 1
	if target == 3:
		score += 1
		$Pollination/FlowerOK.play()
		reset_target()
		
func reset_target():
	target = 0
	
func pollition_effect():
	$Pollination.emitting = true
	$ShakeAnimation.play("shake")
	add_score()

func _on_Timer_timeout():
	$Pollination_Timer.start()
	
func _on_Pollination_Timer_timeout():
	$Pollination/FlowerOK.play()
	pollition_effect()

func _on_MenuTimer_timeout():
	get_tree().change_scene("res://GUI/MainMenu.tscn")

func _on_ChangeSceneTimer_timeout():
	get_tree().change_scene("res://Worlds/World_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
