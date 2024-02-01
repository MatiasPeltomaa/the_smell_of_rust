extends Node2D

func _ready():
	$interlude_triangle.play()

func _process(_delta):
	$boss_fight_camera.offset = Vector2(randf_range(-0.23, 0.23), randf_range(-0.23, 0.23))

func _on_change_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/boss_fight.tscn")
