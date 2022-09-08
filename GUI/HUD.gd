extends Control

onready var flowers_texture = $FlowersTexture
	
func update_lives(val):
	flowers_texture.rect_size.x = val * 143
