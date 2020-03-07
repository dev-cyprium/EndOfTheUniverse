extends Label

func _on_Gauge_StateChanged(state):
	self.text = str(state) + "/8"
