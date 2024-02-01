extends Node2D

var spike: Node2D
var bullet: Node2D

func _ready():
	$boss.position.x = 319

func _process(_delta):
	if $spike_timer.is_stopped():
		spike = load("res://scenes/spike.tscn").instantiate()
		add_child(spike)
		spike.position.y = 60
		spike.position.x = randf_range(160.0, 480.0)
		$spike_timer.start()
		
	if Input.is_action_pressed("ui_select"):
		$press_space.visible = false

	if $shake_timer_1.is_stopped():
		$boss_fight_camera.offset = Vector2(randf_range(-0.23, 0.23), randf_range(-0.23, 0.23))
		
	if $shake_timer_2.is_stopped():
		$boss_fight_camera.offset = Vector2(randf_range(-0.46, 0.46), randf_range(-0.46, 0.46))
		
	if $shake_timer_3.is_stopped():
		$boss_fight_camera.offset = Vector2(randf_range(-0.69, 0.69), randf_range(-0.69, 0.69))
		
	if $shake_timer_4.is_stopped():
		$boss_fight_camera.offset = Vector2(randf_range(-0.92, 0.92), randf_range(-0.92, 0.92))
		
	if $fail_timer.is_stopped():
		$rust_fail_animation.play("rust_fail_animation")
		
	if $boss.position.x == 321:
		get_tree().change_scene_to_file("res://scenes/epilogue.tscn")
			
	if !has_node("player_flying"):
		get_tree().reload_current_scene()

func _on_rust_fail_animation_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://scenes/game.tscn")
