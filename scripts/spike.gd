extends Node2D

var spike_velocity = 123

func _ready():
	pass

func _process(delta):
	self.position.y += delta * spike_velocity

	if self.position.y > 360:
		self.queue_free()

func _on_spike_area_area_entered(area):
	if area.name == "player_flying_area":
		self.queue_free()
