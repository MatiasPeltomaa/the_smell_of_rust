extends Node2D

var animation_stopper: int = 0

func _ready():
	pass

func _process(delta):
	$rust_gradient.scale.x += delta / 7.3
	$rust_gradient.scale.y += delta / 7.3
	
	if $player.position.x < 173:
		$parallax_background/parallax_layer_1/rain.visible = true
		$rain_noise.play()

	if $player.position.x < 140:
		$player.rotate(-0.000023)

	if $player.position.x < 2:
		get_tree().change_scene_to_file("res://scenes/interlude.tscn")
