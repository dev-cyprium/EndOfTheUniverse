extends Node

onready var clicker = preload("res://Scenes/Selectable.tscn")
var go = null
var prevParent = null
var handled = false

func _ready():
	go = clicker.instance()

# func _input(event):
#	if handled:
#		handled = false
#		return
	
#	if event is InputEventMouseButton:
#		if prevParent != null:
#			prevParent.remove_child(go)
#			prevParent = null

func _handle_selected(node):
	if prevParent != null:
		prevParent.remove_child(go)
	node.add_child(go)
	
	if node.texture.get_width() > 32:
		go.scale = Vector2(2, 2)
	else:
		go.scale = Vector2(1, 1)
	
	prevParent = node
	handled = true
