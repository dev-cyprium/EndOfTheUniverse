extends Control

signal CancelSelection
signal EarthGaugePress
var asteroid_progress = null
var camera = null
var pan_top = false
var pan_bottom = false
var pan_left = false
var pan_right = false

var dragging = false
var movement = null

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
	if dragging and movement:
		camera.position += -movement * 1.12
		movement = 0

func _input(event):
	if event is InputEventMouseMotion:
		if (dragging):
			movement = event.relative

	if event is InputEventMouseButton:
		if event.button_index == 2 and not(dragging):
			dragging = true
		elif event.button_index == 2 and dragging:
			dragging = false
