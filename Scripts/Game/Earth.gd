extends "./Rotate.gd"
var rocket = preload("res://Scenes/GameObject/Rocket.tscn")
var spawn = null

func _ready():
	spawn = find_node("RocketSpawnPoint")
	spawn_rocket()

func spawn_rocket():
	var node = rocket.instance()
	spawn.add_child(node)
