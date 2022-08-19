extends KinematicBody2D

export (int) var min_move_speed = 100
export (int) var max_move_speed = 350
export (int) var stop_distance = 20


func _process(_delta):
	_look_at_mouse()
	_move_to_mouse()
	
func _look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90
	
func _move_to_mouse():
	if position.distance_to(get_global_mouse_position()) > stop_distance:
		var direction = get_global_mouse_position() - position
		var normalized_direction = direction.normalized()
		var direction_distance = direction.length()
		move_and_slide(normalized_direction * max(min_move_speed,min(max_move_speed, direction_distance)))


func move_to_flouer():
	# get flouer nodes
	var flouer_points = get_tree().get_nodes_in_group("flouer")
	var position_player = get_tree().get_nodes_in_group("player")
	# assume the first flouer node is closest
	var nearest_flouer_point = flouer_points[0]
	var player = get_tree().get_nodes_in_group("player")
	
	# look trough flouer nodes to see if any are closer
	for flouer_point in flouer_points:
		if flouer_point.global_position.distance_to(position_player.global_position) < nearest_flouer_point.global_position.distance_to(position_player.global_position):
			nearest_flouer_point = flouer_point
			
	# reposition player
	position_player.global_position = nearest_flouer_point.global_position
			
