extends KinematicBody2D

export (int) var speed = 200


func _physics_process(delta):
	process_mouse()

	
func process_mouse():
	var target = get_viewport().get_mouse_position().x
	var bee_width = get_node("CollisionShape2D").shape.extents.x
	var viewport_width = get_viewport().size.x
	if position.x < target:
		if not test_move(Transform2D(transform), Vector2(1,0)):
			position.x = min(target, viewport_width - bee_width)
	elif position.x > target:
		if not test_move(Transform2D(transform), Vector2(-1,0)):
			position.x = max(target, bee_width)


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
			
