extends Node

export(String, "None", "EarthGauge") var extra
onready var clicker = preload("res://Scenes/GameObject/Selectable.tscn")

signal ItemSelected

func _ready():
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

func _on_KinematicBody2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if(event.button_index == 1 and 
		   event.is_pressed() and
		   !event.is_echo()):
			spawn_selection(self)
