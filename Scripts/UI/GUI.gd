extends Control

signal CancelSelection

func _on_Button_pressed():
	emit_signal("CancelSelection")
