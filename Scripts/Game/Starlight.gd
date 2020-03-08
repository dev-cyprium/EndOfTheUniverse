extends Node

onready var texture = preload("res://assets/star.png")

onready var material = preload("res://Material/Fader.tres");

var stars = []
const STAR_COUNT = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	for _n in range(STAR_COUNT):
		add_new_star()

func add_new_star():
	var vps = get_viewport().size
	var star = Sprite.new()
	var base_opacity = randf()
	star.z_index = -20
	star.texture = texture
	var m = material.duplicate()
	m.set_shader_param("base_opacity", base_opacity)
	star.set_material(m)
	
	star.global_position = Vector2(
		rand_range(0, vps.x), 
		rand_range(0, vps.y)
	)
	
	stars.append({'star': star, 'bo': base_opacity, 'mat': m})
	self.add_child(star)
	
func _process(delta):
	var vps = get_viewport().size
	for star in stars:
		var m = star['mat']
		star['bo'] -= delta * 0.1
		m.set_shader_param("base_opacity", star['bo'])
		
		
		if (star['bo'] <= 0):
			star['bo'] = 1.0
			star['star'].global_position = Vector2(
				rand_range(0, vps.x), 
				rand_range(0, vps.y))
