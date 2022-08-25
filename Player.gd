extends KinematicBody2D

class_name Player 

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

		
		
