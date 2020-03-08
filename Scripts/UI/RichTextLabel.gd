extends RichTextLabel

var texts = [
	"Captain, the matters are urgent. We need to evacuate the Solar system right away! The sun is about to consume everything!",
	"Start by minning that asteriod over there. And be quick! There is no time to spear",
	"[LMB] on Earth to create a new asteroid miner",
	"[RMB] to pan your view"
]

var index = 0
var activeText = texts[index]
var timer = 0
var marker = 0
var transition = 0

func next():
	index += 1
	if not (index > texts.size() - 1):
		marker = 0
		timer = 0
		transition = 0
		self.activeText = texts[index]
	else:
		self.find_parent("Transmition").hide()

func _process(delta):
	timer += delta
	
	if timer > 0.04:
		marker += 1
		timer = 0

	if marker >= activeText.length():
		transition += delta
		
	if transition > 2.3:
		transition = 0
		next()

	self.text = activeText.substr(0, marker)
