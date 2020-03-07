extends Node
tool

export(Texture) var on_state;
export(Texture) var off_state;
export(Texture) var super_state;

signal StateChanged
var state = 0

func _ready():
	print("INITIALIZED!")
	for child in get_child(0).get_child(1).get_children():
		child.texture = off_state;

func _on_Buy_pressed():
	if state + 1 > 8:
		return
	state = state + 1
	emit_signal("StateChanged", state)
	var i = 0
	for child in get_child(0).get_child(1).get_children():
		if state >= 5:
			var new_state = state % 5 + 1
			if i < new_state:
				child.texture = super_state
		else:
			if i < state:
				child.texture = on_state
		i += 1
