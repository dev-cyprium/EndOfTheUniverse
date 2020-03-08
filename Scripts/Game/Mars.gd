extends "./Rotate.gd"
var rocket = preload("res://Scenes/GameObject/MarsRocket.tscn")
var spawn = null
var manager = null

func _ready():
	manager = get_tree().get_nodes_in_group("manager")[0]
	spawn = get_node("../earth/RocketSpawnPoint")

func spawn_rocket():
	var node = rocket.instance()
	spawn.add_child(node)

func _on_GUI_MarsGaugePress(gauge):
	if manager.get_resource("asteroid") >= 40:
		manager.incr_resource("asteroid", -40)
		gauge.increase_count()
		spawn_rocket()
