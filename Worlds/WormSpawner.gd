extends Node

export (Array, PackedScene) var worms

onready var spawn_timer = $SpawnTimer

var spawn_positions = null

func _ready():
	spawn_positions = $SpawnPositions.get_children()

func _on_SpawnTimer_timeout():
	pass # Replace with function body.
