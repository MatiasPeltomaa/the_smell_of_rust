extends Node2D

func _ready():
	$fade_to_white.play("fade_to_white")

func _process(_delta):
	$boss_fight_camera.offset = Vector2(randf_range(-0.92, 0.92), randf_range(-0.92, 0.92))

func _on_fade_to_white_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://scenes/main.tscn")
