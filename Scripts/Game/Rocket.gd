extends Area2D
var target = null

func _ready():
	target = get_tree().get_nodes_in_group("asteroid")[0]

var t = 0
func _physics_process(delta):
	var desired = target.position - self.position
	desired = desired.normalized()
	
	self.position += desired
	
	self.rotation = desired.angle() + PI / 2


func _on_KinematicBody2D_area_shape_entered(_area_id, area, _b, _c):
	if (target.name == "asteroid" and area.name == "AsteroidArea"):
		target = get_parent().get_parent()
	if (target.name != "asteroid" and area.name == "EarthArea"):
		target = get_tree().get_nodes_in_group("asteroid")[0]
