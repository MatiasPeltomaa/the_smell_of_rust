extends Node2D

var bullet_speed = 230

func _ready():
	pass

func _process(delta):
	position.y += -delta * bullet_speed
	
	if self.global_position.x > 640 || self.global_position.x < 0:
		self.queue_free()
		
	if self.global_position.y > 360 || self.global_position.y < 0:
		self.queue_free()
