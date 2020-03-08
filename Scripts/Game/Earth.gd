extends "./Rotate.gd"
var rocket = preload("res://Scenes/GameObject/Rocket.tscn")
var spawn = null
var manager = null
var firstRocket = true

func _ready():
	manager = get_tree().get_nodes_in_group("manager")[0]
	spawn = find_node("RocketSpawnPoint")

func spawn_rocket():
	var node = rocket.instance()
	spawn.add_child(node)

func _on_GUI_EarthGaugePress(gauge):
	if firstRocket:
		firstRocket = false
		gauge.increase_count()
		spawn_rocket()
	else:
		if manager.get_resource("asteroid") >= 5:
			manager.incr_resource("asteroid", -5)
			gauge.increase_count()
			spawn_rocket()
