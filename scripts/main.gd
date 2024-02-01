extends Node

var can_play: bool = false

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	$menu_rust_animation.play("rust_text")
	$menu_credits.play("credits")  

func _process(_delta):
	if Input.is_anything_pressed() and can_play == true:
		get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_press_any_timer_timeout():
	$menu_press_any.visible = true
	$press_any_repeat_timer.start()

func _on_press_any_repeat_timer_timeout():
	$menu_press_any.visible = !$menu_press_any.visible

func _on_buffer_timer_timeout():
	can_play = true
