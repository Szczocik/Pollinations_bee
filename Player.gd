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


func move_to_flower():
	pass
	# get flower nodes
	# var flower_points = get_tree().get_nodes_in_group("flower")
	# var position_player = get_tree().get_nodes_in_group("player")
	# assume the first flower node is closest
	# var nearest_flower_point = flower_points[0]
	# var player = get_tree().get_nodes_in_group("player")
	
	# look trough flower nodes to see if any are closer
	# for flower_point in flower_points:
		# if flower_point.global_position.distance_to(position_player.global_position) < nearest_flower_point.global_position.distance_to(position_player.global_position):
			# nearest_flower_point = flower_point
			
	# reposition player
	# position_player.global_position = nearest_flower_point.global_position
			
