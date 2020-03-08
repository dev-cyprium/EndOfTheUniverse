extends Area2D
var target = null
var insideEarthTimer = 0
var insideEarth = false
var insideAsteroidTimer = 0
var insideAsteroid = false
var manager = null
var resourceIncreasedFrame = false
var asteroidInsideFrame = false
var speedScale = 55.0
var destinationGroup = "mars"
var particle = null

func mars():
	return get_tree().get_nodes_in_group("mars")[0]

func _ready():
	particle = get_node("RocketSprite/Flame#1")
	print(particle)
	manager = get_tree().get_nodes_in_group("manager")[0]
	target = mars()

var t = 0


func _process(delta):
	if insideEarth:
		insideEarthTimer += delta
	
	if insideAsteroid:
		insideAsteroidTimer += delta
	
	if insideAsteroidTimer >= 0.4 and not asteroidInsideFrame:
		particle.emitting = false
		asteroidInsideFrame = true
	
	if insideEarthTimer >= 0.4 and not resourceIncreasedFrame:
		resourceIncreasedFrame = true
		particle.emitting = false
		manager.incr_resource('dust', 5)
	
	if insideAsteroidTimer > 2.3:
		insideAsteroidTimer = 0
		insideAsteroid = false
		asteroidInsideFrame = false
		self.show()
		target = get_parent().get_parent()
	
	if insideEarthTimer > 2.3:
		insideEarthTimer = 0
		insideEarth = false
		resourceIncreasedFrame = false
		self.show()
		target = mars()
		

func _physics_process(delta):
	if target == null:
		return
	
	var movement = target.global_position - self.global_position
	if movement.length() > 10:
		movement = movement.normalized()
		self.global_position += movement * 140 * delta
	
	if not insideAsteroid and not insideEarth:
		particle.emitting = true
		self.rotation = movement.angle() + PI / 2


func _on_KinematicBody2D_area_shape_entered(_area_id, area, _b, _c):
	if (target.is_in_group(destinationGroup) and area.name == "MarsArea"):
		insideAsteroid = true
	if (target.name != "MarsTarget" and area.name == "EarthArea"):
		insideEarth = true
