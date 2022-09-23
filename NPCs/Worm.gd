extends Area2D

export (int) var speed = 50

func _physics_process(delta):
	global_position.y += speed * delta

func _on_Worm2_body_entered(body):
	if body is Player:
		get_tree().call_group("player", "down_score")
		$SFX.play()
		
func _on_Worm3_body_entered(body):
	if body is Player:
		get_tree().call_group("player", "add_point_target")
		$SFX.play()
		$Sprite.visible = false

func boom_effect():
	$Boom.start()
		
func _on_Worm1_body_entered(body):
	if body is Player:
		boom_effect()
		$SFX.play()
		$Sprite.visible = false
