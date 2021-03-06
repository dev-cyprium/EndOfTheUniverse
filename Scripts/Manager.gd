extends Node

onready var clicker = preload("res://Scenes/GameObject/Selectable.tscn")
var go = null
var prevParent = null
var handled = false
var resources = {
	"asteroid": 0,
	"dust": 0
}

signal ResourceUpdate

func _ready():
	go = clicker.instance()

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

func incr_resource(type, amt):
	print("INCR CALLED!")
	resources[type] += amt
	emit_signal("ResourceUpdate", resources)
	
func get_resource(type):
	return resources[type]

func _on_GUI_CancelSelection():
	if prevParent:
		prevParent.remove_child(go)
		var nodes = get_tree().get_nodes_in_group("extra")
		for node in nodes:
			node.hide()
	prevParent = null

