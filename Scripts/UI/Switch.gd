extends Node
tool

export(Texture) var on_state;
export(Texture) var off_state;
export(Texture) var super_state;

signal ButtonPresss
signal StateChanged
var state = 0

func _ready():
	for child in get_child(0).get_child(1).get_children():
		child.texture = off_state;

func increase_count():
	state = state + 1
	on_state_change()
	
func on_state_change():
	if state > 8:
		return
	
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

func _on_Buy_pressed():
	emit_signal("ButtonPresss", self)
