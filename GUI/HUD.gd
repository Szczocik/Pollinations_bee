extends Control

onready var flowers_texture = $FlowersTexture
onready var worms_texture = $WormTexture
	
func update_flowers(val):
	flowers_texture.rect_size.x = val * 143

func update_worms(val):
	worms_texture.rect_size.x = val * 64
