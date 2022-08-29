extends KinematicBody2D

class_name Player

export (int) var min_move_speed = 100
export (int) var max_move_speed = 250
export (int) var stop_distance = 20

var strip = []

var moving = false 
var destination = Vector2()
var movement = Vector2()
var Flower = load("res://Flower/Flower.tscn")



func _physics_process(delta):
	process_mouse()	
	
		
func process_mouse():
	var target = get_viewport().get_mouse_position().x
	var bee_width = get_node("CollisionShape2D").shape.extents.x
	var viewport_width = get_viewport().size.x
	if position.x < target:
		#if not test_move(Transform2D(transform), Vector2(1,0)):
			position.x = min(target, viewport_width - bee_width)
	elif position.x > target:
		#if not test_move(Transform2D(transform), Vector2(-1,0)):
			position.x = max(target, bee_width)

func change_moving():
	pass
	
	
func move_to_flower():
	pass
		

func _look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90
	
func _move_to_mouse():
	if position.distance_to(get_global_mouse_position()) > stop_distance:
		var direction = get_global_mouse_position() - position
		var normalized_direction = direction.normalized()
		var direction_distance = direction.length()
		move_and_slide(normalized_direction * max(min_move_speed,min(max_move_speed, direction_distance)))
		
func pollition_effect():
	$Pollination.emitting = true
	

func _on_Player_area_entered(area):
	if area:
		strip.push_front(area.name)
		strip.remove(1)
		print(strip)
