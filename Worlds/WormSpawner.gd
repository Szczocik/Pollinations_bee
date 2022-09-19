extends Node

signal spawn_worm(WormScene, location)

export (Array, PackedScene) var worms

onready var spawn_timer = $SpawnTimer

var spawn_positions = null

func _ready():
	spawn_positions = $SpawnPositions.get_children()

func _on_SpawnTimer_timeout():
	spawn_random_worm()

func spawn_random_worm():
	var rand_worm = worms[randi() % worms.size()]
	var rand_index = randi() % spawn_positions.size()
	emit_signal("spawn_worm", rand_worm, spawn_positions[rand_index].global_position)
