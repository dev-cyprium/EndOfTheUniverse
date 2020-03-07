extends Node
tool

export(Texture) var on_state;
export(Texture) var off_state;
export(Texture) var super_state;

var state = 0

func _ready():
	for child in get_child(0).get_child(1).get_children():
		child.texture = off_state;

func _on_Buy_pressed():
	state = state + 1
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
