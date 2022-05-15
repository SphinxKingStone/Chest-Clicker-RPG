extends Control

var character_start_position
var enemy_start_position
var enemy_name = "skeleton" # will be just enemy.name

func _ready():
	character_start_position = $Character.position
	$Character.connect("frame_changed", self, "player_attack_frame")
	$Enemy.connect("frame_changed", self, "enemy_attack_frame")
	$attack_up.connect("pressed", self, "attack_button_pressed", [$attack_up])
	$attack_mid.connect("pressed", self, "attack_button_pressed", [$attack_mid])
	$attack_down.connect("pressed", self, "attack_button_pressed", [$attack_down])
	
	# example of sprite setup
	$Enemy.frames = EnemyData.enemies[enemy_name].frames
	play_enemy_animation("idle")

func attack_button_pressed(button):
	$Character.play(button.name)
	move_character(0.2, "forward")
	yield($Character, "animation_finished")
	move_character(0.2, "backwards")
	$Character.play("idle")

func player_attack_frame():
	match $Character.animation:
		"attack_down":
			if $Character.frame == 2:
				play_enemy_animation("hit")
				yield($Enemy, "animation_finished")
				play_enemy_animation("idle")
		"attack_mid":
			if $Character.frame == 1:
				play_enemy_animation("hit")
				yield($Enemy, "animation_finished")
				play_enemy_animation("idle")
		"attack_up":
			if $Character.frame == 2:
				play_enemy_animation("hit")
				yield($Enemy, "animation_finished")
				play_enemy_animation("idle")

func enemy_attack_frame():
	if $Enemy.animation == "attack" and $Enemy.frame == 8:
		$Character.play("hit")
		yield($Character, "animation_finished")
		$Character.play("idle")

func play_enemy_animation(anim):
	var prev_animation = $Enemy.animation
	var prev_pos_offset = EnemyData.enemies[enemy_name].sprite_properties[prev_animation].position_offset
	var current_pos_offset = EnemyData.enemies[enemy_name].sprite_properties[anim].position_offset
	$Enemy.play(anim)
	$Enemy.scale = EnemyData.enemies[enemy_name].sprite_properties[$Enemy.animation].scale
	$Enemy.position += current_pos_offset - prev_pos_offset
#	$Enemy.position -= prev_pos_offset

func move_character(speed, direction):
	var tw = Tween.new()
	add_child(tw)
	tw.start()
	var start_pos = $Character.position
	var new_pos
	if direction == "forward":
		new_pos = start_pos + Vector2(distance_to_enemy(), 0)
	elif direction == "backwards":
		new_pos = character_start_position
	tw.interpolate_property($Character, "position", start_pos, new_pos, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	yield(tw, "tween_completed")
	remove_child(tw)

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

func _on_Button_pressed():
	enemy_start_position = $Enemy.position
	play_enemy_animation("attack")
	move_enemy(enemy_start_position, 0.2, "forward")
	yield($Enemy, "animation_finished")
	play_enemy_animation("idle")
	move_enemy(enemy_start_position, 0.2, "backwards")
	

func distance_to_enemy():
	var character_idle_frame = $Character.frames.get_frame("idle", 0)
	var character_frame_size = character_idle_frame.get_size() * $Character.scale
	var enemy_idle_frame = $Enemy.frames.get_frame("idle", 0)
	var enemy_frame_size = enemy_idle_frame.get_size() * $Enemy.scale
	
	var char_right_pos = $Character.position.x + (character_frame_size[0]/2)
	var enemy_left_pos = $Enemy.position.x - (enemy_frame_size[0]/2)
	
	return enemy_left_pos - char_right_pos + 90
