extends Control

onready var flowers_texture = $FlowersTexture
	
func update_flowers(val):
	flowers_texture.rect_size.x = val * 143
