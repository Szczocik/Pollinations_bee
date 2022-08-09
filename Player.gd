extends KinematicBody2D


export (int) var move_speed = 250
export (int) var stop_distance = 20


func _process(delta):
	_look_at_mouse()
	_move_to_mouse()
	
func _look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90
	
func _move_to_mouse():
	if position.distance_to(get_global_mouse_position()) > stop_distance:
		var direction = get_global_mouse_position() - position
		var normalized_direction = direction.normalized()
		move_and_slide(normalized_direction * move_speed)
