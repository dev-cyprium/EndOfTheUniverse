extends Node
tool

export(Texture) var onState;
export(Texture) var offState;

func _ready():
	for child in get_child(0).get_child(1).get_children():
		child.texture = offState;
