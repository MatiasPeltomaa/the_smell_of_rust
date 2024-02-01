extends CharacterBody2D

var speed = 23.0
var jump_velocity = -73
var rotation_speed_up = -0.12
var rotation_speed_down = 0.24

var speed_factor = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		$grass_particle.emitting = false

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		$grass_particle.emitting = false

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * (speed * speed_factor)
		if is_on_floor():
			$grass_particle.emitting = true
		if direction < 0:
			$player_sprite.rotate(rotation_speed_up)
			$reflection_sprite.rotate(rotation_speed_up)
			speed_factor = 0.73
		else:
			$player_sprite.rotate(rotation_speed_down)
			$reflection_sprite.rotate(rotation_speed_down)
			speed_factor = 1
	else:
		velocity.x = move_toward(velocity.x, 0, (speed * speed_factor))
		$grass_particle.emitting = false

	position.x = clamp(position.x, 0, 640)

	move_and_slide()
		
	if position.x < 164:
		$water_particle.emitting = true
		speed = 13.0
		rotation_speed_up = -0.06
		$player_camera.offset = Vector2(randf_range(-0.23, 0.23), randf_range(-0.23, 0.23))
		
	if position.x < 140:
		$player_camera.offset = Vector2(randf_range(-0.46, 0.46), randf_range(-0.46, 0.46))

	if position.x < 120:
		$player_camera.offset = Vector2(randf_range(-0.73, 0.73), randf_range(-0.73, 0.73))
		
	if position.x < 80:
		$reflection_sprite.visible = true
	else:
		$reflection_sprite.visible = false
		
	if position.x < 40:
		$player_camera.offset = Vector2(randf_range(-1, 1), randf_range(-1, 1))

	if position.x > 560:
		get_tree().reload_current_scene()
