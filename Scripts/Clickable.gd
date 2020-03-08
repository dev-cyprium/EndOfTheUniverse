extends Node

export(String, "None", "EarthGauge", "MarsGauge") var extra
onready var clicker = preload("res://Scenes/GameObject/Selectable.tscn")
var sound_node = null

signal ItemSelected

func _ready():
	sound_node = get_node("Click")
	var manager = get_tree().get_nodes_in_group("manager")
	var _ret = self.connect("ItemSelected", manager[0], "_handle_selected")

func spawn_selection(node):
	var nodes = get_tree().get_nodes_in_group("extra")
	for node in nodes:
		if node.name == extra:
			node.show()
		else:
			node.hide()
	emit_signal("ItemSelected", node)

func _on_clickable_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if(event.button_index == 1 and 
		   event.is_pressed() and
		   !event.is_echo()):
			if (sound_node):
				sound_node.play()
			spawn_selection(self)
