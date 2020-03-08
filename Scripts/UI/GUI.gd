extends Control

signal CancelSelection
var asteroid_progress = null

func _ready():
	asteroid_progress = find_node("AsteroidProgress")

func _on_Button_pressed():
	emit_signal("CancelSelection")


func _on_Manager_ResourceUpdate(resources):
	asteroid_progress.value = resources["asteroid"]
