extends Control

signal CancelSelection
signal EarthGaugePress
var asteroid_progress = null
var camera = null
var pan_top = false
var pan_bottom = false
export var pan_speed = 250.0
export var pan_edge = 35

func _ready():
	camera = get_tree().get_nodes_in_group("main_camera")[0]
	asteroid_progress = find_node("AsteroidProgress")

func _on_Button_pressed():
	emit_signal("CancelSelection")

func _on_Manager_ResourceUpdate(resources):
	asteroid_progress.value = resources["asteroid"]

func _on_EarthGauge_ButtonPresss(gauge):
	emit_signal("EarthGaugePress", gauge)

func _process(delta):
	if pan_top:
		camera.position.y -= delta * pan_speed
		
	if pan_bottom:
		camera.position.y += delta * pan_speed

	
func _input(event):
	if event is InputEventMouseMotion:
		if event.position.y < pan_edge:
			pan_top = true
			
		if event.position.y > pan_edge:
			pan_top = false
			
		if event.position.y > get_viewport().size.y - pan_edge:
			pan_bottom = true
			
		if event.position.y < get_viewport().size.y - pan_edge:
			pan_bottom = false
