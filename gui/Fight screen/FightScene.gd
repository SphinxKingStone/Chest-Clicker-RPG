extends Control

var character_start_position
var enemy_start_position
var enemy_name = "fire_worm" # will be just enemy.name
var enemy = EnemyData.enemies["fire_worm"]
var turn = ""

signal player_finished_attacking
signal enemy_finished_attacking
signal player_got_hit
signal enemy_got_hit

func _ready():
	character_start_position = $Player.position
	$Player.connect("frame_changed", self, "player_attack_frame")
	$Enemy.connect("frame_changed", self, "enemy_attack_frame")
	$attack_up.connect("pressed", self, "attack_button_pressed", [$attack_up])
	$attack_mid.connect("pressed", self, "attack_button_pressed", [$attack_mid])
	$attack_down.connect("pressed", self, "attack_button_pressed", [$attack_down])
	Fighting.connect("turn_change", self, "turn_changed")
	self.connect("player_finished_attacking", self, "on_player_finished_attacking")
	self.connect("enemy_finished_attacking", self, "on_enemy_finished_attacking")
	self.connect("player_got_hit", self, "on_player_got_hit")
	self.connect("enemy_got_hit", self, "on_enemy_got_hit")
	Fighting.connect("defeat", self, "defeat")
	
	start_fight()

# Functional
func start_fight():
	# example of sprite setup
	$Enemy.frames = enemy.frames
	play_enemy_animation("idle")
	
	# test fighting
	Fighting.initiate_fight(Character, enemy)
	$enemy_health/Label.text = str(enemy.stats.life) + "/" + str(enemy.stats.life)
	$player_health/Label.text = str(stepify(Character.stats.life, 1.0)) + "/" + str(stepify(Character.stats.life, 1.0))
	
	if turn == "enemy":
		$attack_up.disabled = true
		$attack_mid.disabled = true
		$attack_down.disabled = true
		yield(get_tree().create_timer(0.5), "timeout")
		enemy_attack()
	if turn == "player":
		$attack_up.disabled = false
		$attack_mid.disabled = false
		$attack_down.disabled = false

# Functional
func on_player_finished_attacking():
	#just some delay so fight is not too fast
	yield(get_tree().create_timer(0.5), "timeout")
	
	enemy_attack()

# Functional
func on_enemy_finished_attacking():
	#just some delay so fight is not too fast
	yield(get_tree().create_timer(0.2), "timeout")
	
	$attack_up.disabled = false
	$attack_mid.disabled = false
	$attack_down.disabled = false

# Player Attacks
func attack_button_pressed(button):
	Fighting.attack(Fighting.player, Fighting.enemy, "top")
	
	$attack_up.disabled = true
	$attack_mid.disabled = true
	$attack_down.disabled = true
	
	$Player.play(button.name)
	move_character(0.2, "forward")
	yield($Player, "animation_finished")
	move_character(0.2, "backwards")
	$Player.play("idle")
	
	# waiting for animation to finish
	yield(get_tree().create_timer(0.2), "timeout")
	emit_signal("player_finished_attacking")

# Enemy Attacks
func enemy_attack():
	Fighting.attack(Fighting.enemy, Fighting.player, "top")
	
	$attack_up.disabled = true
	$attack_mid.disabled = true
	$attack_down.disabled = true
	
	enemy_attack_animation()

func on_player_got_hit():
	$player_health/Label.text = str(Fighting.get_hp("player")) + "/" + str(stepify(Character.stats.life, 1.0))
	$player_health.value = Fighting.get_hp("player") / Character.stats.life * 1000

func on_enemy_got_hit():
	$enemy_health/Label.text = str(Fighting.get_hp("enemy")) + "/" + str(enemy.stats.life)
	$enemy_health.value = Fighting.get_hp("enemy") / enemy.stats.life * 1000

# Animation
func enemy_attack_animation():
	enemy_start_position = $Enemy.position
	play_enemy_animation("attack")
	move_enemy(enemy_start_position, 0.2, "forward")
	yield($Enemy, "animation_finished")
	play_enemy_animation("idle")
	move_enemy(enemy_start_position, 0.2, "backwards")
	
	# waiting for animation to finish
	yield(get_tree().create_timer(0.2), "timeout")
	emit_signal("enemy_finished_attacking")

# Animation
func player_attack_frame():
	match $Player.animation:
		"attack_down":
			if $Player.frame == 2:
				play_enemy_animation("hit")
				show_damage_number("enemy", Fighting.last_damage_calculated_data.damage)
				yield($Enemy, "animation_finished")
				emit_signal("enemy_got_hit")
				play_enemy_animation("idle")
		"attack_mid":
			if $Player.frame == 1:
				play_enemy_animation("hit")
				show_damage_number("enemy", Fighting.last_damage_calculated_data.damage)
				yield($Enemy, "animation_finished")
				emit_signal("enemy_got_hit")
				play_enemy_animation("idle")
		"attack_up":
			if $Player.frame == 2:
				play_enemy_animation("hit")
				show_damage_number("enemy", Fighting.last_damage_calculated_data.damage)
				yield($Enemy, "animation_finished")
				emit_signal("enemy_got_hit")
				play_enemy_animation("idle")

func show_damage_number(entity, number):
	if entity == "enemy":
		$DamageTextPopUp.position = Vector2(562, 256)
		$DamageTextPopUp/DamageText.text = str(number)
		$DamageTextPopUp/DamageText/AnimationPlayer.play("TextShowUp")
	elif entity == "character":
		$DamageTextPopUp.position = Vector2(142, 256)
		$DamageTextPopUp/DamageText.text = str(number)
		$DamageTextPopUp/DamageText/AnimationPlayer.play("TextShowUp")

# Animation
func enemy_attack_frame():
	# only for skeleton
	if $Enemy.animation == "attack" and $Enemy.frame == 8:
		$Player.play("hit")
		show_damage_number("character", Fighting.last_damage_calculated_data.damage)
		yield($Player, "animation_finished")
		emit_signal("player_got_hit")
		$Player.play("idle")

# Animation
func play_enemy_animation(anim):
	var prev_animation = $Enemy.animation
	var prev_pos_offset = EnemyData.enemies[enemy_name].sprite_properties[prev_animation].position_offset
	var current_pos_offset = EnemyData.enemies[enemy_name].sprite_properties[anim].position_offset
	$Enemy.play(anim)
	$Enemy.scale = EnemyData.enemies[enemy_name].sprite_properties[$Enemy.animation].fight_scale
	$Enemy.position += current_pos_offset - prev_pos_offset
#	$Enemy.position -= prev_pos_offset

# Animation
func move_character(speed, direction):
	var tw = Tween.new()
	add_child(tw)
	tw.start()
	var start_pos = $Player.position
	var new_pos
	if direction == "forward":
		new_pos = start_pos + Vector2(distance_to_enemy(), 0)
	elif direction == "backwards":
		new_pos = character_start_position
	tw.interpolate_property($Player, "position", start_pos, new_pos, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	yield(tw, "tween_completed")
	remove_child(tw)
	tw.queue_free()

# Animation
func move_enemy(enemy_start_position, speed, direction):
	var tw = Tween.new()
	add_child(tw)
	tw.start()
	var start_pos = $Enemy.position
	var new_pos
	if direction == "forward":
		new_pos = start_pos - Vector2(distance_to_enemy(), 0)
	elif direction == "backwards":
		new_pos = enemy_start_position
		
	tw.interpolate_property($Enemy, "position", start_pos, new_pos, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	yield(tw, "tween_completed")
	remove_child(tw)
	tw.queue_free()

# Animation calculations
func distance_to_enemy():
	var character_idle_frame = $Player.frames.get_frame("idle", 0)
	var character_frame_size = character_idle_frame.get_size() * $Player.scale
	var enemy_idle_frame = $Enemy.frames.get_frame("idle", 0)
	var enemy_frame_size = enemy_idle_frame.get_size() * $Enemy.scale
	
	var char_right_pos = $Player.position.x + (character_frame_size[0]/2)
	var enemy_left_pos = $Enemy.position.x - (enemy_frame_size[0]/2)
	
	return enemy_left_pos - char_right_pos + 90

func turn_changed(turn):
	if turn.empty():
		return
	self.turn = turn[0]

func defeat():
	SceneTransition.change_scene("res://gui/Exploring screen/Scenes/LocationScene.tscn")
