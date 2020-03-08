extends Label

func _on_AsteroidProgress_value_changed(value):
	self.text = str(value) + "/100"
