extends "res://Scripts/Clickable.gd"

export var rotate_speed = 1.0

var sun = null
var angle = 0.1

func _ready():
	sun = get_parent()

func spawn_rocket():
	pass
	
func _process(delta):
	self.position = self.position.rotated((angle * rotate_speed) * delta)
