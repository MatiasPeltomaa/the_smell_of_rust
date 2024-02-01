extends Node2D

var bullet_velocity = 123
var rotation_speed = 123

func _ready():
	pass

func _process(delta):
	self.position.y += delta * bullet_velocity
	
	self.rotation += rotation_speed * delta

	if self.position.y > 360:
		self.queue_free()

func _on_bullet_area_area_entered(area):
	if area.name == "player_flying_area":
		self.queue_free()
