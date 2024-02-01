extends Node2D

var base_speed: float = 100
var speed: float = base_speed

var base_rotation_speed = 5.0
var rotation_speed: float = base_rotation_speed

var sprite: Sprite2D = Sprite2D.new()
var player_bullet: Node2D

func _ready():
	sprite = $player_flying_sprite

func _process(delta):
	var movement = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		movement.x += 1
		sprite.rotate(rotation_speed * delta)
	elif Input.is_action_pressed("ui_left"):
		movement.x -= 1
		sprite.rotate(-rotation_speed * delta)
		
	if Input.is_action_pressed("ui_down"):
		movement.y += 1
		sprite.rotate(-rotation_speed * delta)
	elif Input.is_action_pressed("ui_up"):
		movement.y -= 1
		sprite.rotate(rotation_speed * delta)
		
	if Input.is_action_pressed("ui_select"):
		if $bullet_cooldown.is_stopped():
			$bullet_sound.play()
			$player_bullet_particle.emitting = true
			player_bullet = load("res://scenes/player_bullet.tscn").instantiate()
			get_parent().add_child(player_bullet)
			player_bullet.position = $bullet_spawn_position.global_position
			$bullet_cooldown.start()
	else:
		speed = base_speed
		rotation_speed = base_rotation_speed
		$player_bullet_particle.emitting = false
	
	self.position += movement * speed * delta
	
	position.x = clamp(position.x, 160, 480)
	position.y = clamp(position.y, 90, 270)

func _on_water_timer_timeout():
	$water_particle.emitting = true

func _on_player_flying_area_area_entered(area):
	if area.name == "bullet_area" || area.name == "spike_area":
		self.queue_free()
