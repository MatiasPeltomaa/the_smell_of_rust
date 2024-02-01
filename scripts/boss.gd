extends Node2D

var position_checker: int = 5
var bullet_wave: Node2D
var final_bullet_gen: Node2D

var rotation_speed = 23

func _ready():
	$boss_sprite.play("boss_idle")

func _process(delta):
	$boss_rust_gradient.scale.y += delta / 7.3
	$boss_rust_gradient.scale.x += delta / 7.3
	$boss_rust_gradient.position.y -= delta * 17.4
	$boss_rust_gradient.position.x -= delta * 17.4

	$boss_sprite.position.x = randf_range(-1, 1)
	self.rotate(rotation_speed * delta)
	
	if $cooldown.is_stopped():
		bullet_wave = load("res://scenes/bullet.tscn").instantiate()
		get_parent().add_child(bullet_wave)
		bullet_wave.position = $boss_bullet_spawn.global_position
		$cooldown.start()

func _on_boss_area_area_entered(area):
	if area.name == "player_bullet_area" and position_checker == 5:
		$damage_sound.play()
		self.position.x = 200
		position_checker -= 1
		$cooldown.wait_time = 0.63
	elif area.name == "player_bullet_area" and position_checker == 4:
		$damage_sound.play()
		self.position.x = 440
		position_checker -= 1
		$cooldown.wait_time = 0.53
	elif area.name == "player_bullet_area" and position_checker == 3:
		$damage_sound.play()
		self.position.x = 200
		position_checker -= 1
		$cooldown.wait_time = 0.43
	elif area.name == "player_bullet_area" and position_checker == 2:
		$damage_sound.play()
		self.position.x = 440
		position_checker -= 1
		$cooldown.wait_time = 0.33
	elif area.name == "player_bullet_area" and position_checker == 1:
		$damage_sound.play()
		self.position.x = 320
		position_checker -= 1
		$cooldown.wait_time = 0.23
	elif area.name == "player_bullet_area" and position_checker == 0:
		$damage_sound.play()
		self.position.x = 321
