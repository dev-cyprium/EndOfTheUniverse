extends Node
onready var clicker = preload("res://Scenes/Selectable.tscn")

signal ItemSelected

func _ready():
	var manager = get_tree().get_nodes_in_group("manager")
	print("MANAGER: ", manager)
	var _ret = self.connect("ItemSelected", manager[0], "_handle_selected")

func spawn_selection(node):
	emit_signal("ItemSelected", node)

func _on_KinematicBody2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if(event.button_index == 1 and 
		   event.is_pressed() and
		   !event.is_echo()):
			spawn_selection(self)
