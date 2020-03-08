extends Area2D
var target = null
var insideEarthTimer = 0
var insideEarth = false
var insideAsteroidTimer = 0
var insideAsteroid = false
var manager = null
var resourceIncreasedFrame = false
var asteroidInsideFrame = false

func asteroid():
	var asteroids = get_tree().get_nodes_in_group("asteroid")
	return asteroids[randi() % asteroids.size()]

func _ready():
	manager = get_tree().get_nodes_in_group("manager")[0]
	target = asteroid()

var t = 0


func _process(delta):
	if insideEarth:
		insideEarthTimer += delta
	
	if insideAsteroid:
		insideAsteroidTimer += delta
	
	if insideAsteroidTimer >= 0.4 and not asteroidInsideFrame:
		self.hide()
		asteroidInsideFrame = true
	
	if insideEarthTimer >= 0.4 and not resourceIncreasedFrame:
		resourceIncreasedFrame = true
		self.hide()
		manager.incr_resource('asteroid', 1)
	
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
		target = asteroid()
		

func _physics_process(delta):
	if target == null:
		return
		
	var desired = target.position - self.position
	desired = desired.normalized()
	
	self.position += desired
	
	self.rotation = desired.angle() + PI / 2


func _on_KinematicBody2D_area_shape_entered(_area_id, area, _b, _c):
	if (target.is_in_group("asteroid") and area.name == "AsteroidArea"):
		insideAsteroid = true
	if (target.name != "asteroid" and area.name == "EarthArea"):
		insideEarth = true
