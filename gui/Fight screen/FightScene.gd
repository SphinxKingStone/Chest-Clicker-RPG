extends Control

var character_start_position

func _ready():
	character_start_position = $Character.position
	$Character.connect("frame_changed", self, "player_attack_frame")
	$attack_up.connect("pressed", self, "attack_button_pressed", [$attack_up])
	$attack_mid.connect("pressed", self, "attack_button_pressed", [$attack_mid])
	$attack_down.connect("pressed", self, "attack_button_pressed", [$attack_down])
	
	# example of sprite setup
	$Enemy.frames = EnemyData.enemies["skeleton"].frames
	$Enemy.scale = EnemyData.enemies["skeleton"].scale
	$Enemy.play("idle")

func attack_button_pressed(button):
	$Character.play(button.name)
	move_character_forward(0.2)
	yield($Character, "animation_finished")
	move_character_backwards(0.2)
	$Character.play("idle")

func player_attack_frame():
	match $Character.animation:
		"attack_down":
			if $Character.frame == 2:
				$Enemy.play("hit")
				yield($Enemy, "animation_finished")
				$Enemy.play("idle")
		"attack_mid":
			if $Character.frame == 1:
				$Enemy.play("hit")
				yield($Enemy, "animation_finished")
				$Enemy.play("idle")
		"attack_up":
			if $Character.frame == 2:
				$Enemy.play("hit")
				yield($Enemy, "animation_finished") 
				$Enemy.play("idle")

func move_character_forward(speed):
	var tw = Tween.new()
	add_child(tw)
	tw.start()
	var start_pos = $Character.position
	var new_pos = start_pos + Vector2(distance_to_enemy(), 0)
	tw.interpolate_property($Character, "position", start_pos, new_pos, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	yield(tw, "tween_completed") 
	remove_child(tw)

func move_character_backwards(speed):
	var tw = Tween.new()
	add_child(tw)
	tw.start()
	var start_pos = $Character.position
	var new_pos = character_start_position
	tw.interpolate_property($Character, "position", start_pos, new_pos, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	yield(tw, "tween_completed")
	remove_child(tw)

func distance_to_enemy():
	var character_idle_frame = $Character.frames.get_frame("idle", 0)
	var character_frame_size = character_idle_frame.get_size() * $Character.scale
	var enemy_idle_frame = $Enemy.frames.get_frame("idle", 0)
	var enemy_frame_size = enemy_idle_frame.get_size() * $Enemy.scale
	
	var char_right_pos = $Character.position.x + (character_frame_size[0]/2)
	var enemy_left_pos = $Enemy.position.x - (enemy_frame_size[0]/2)
	
	return enemy_left_pos - char_right_pos
	


func _on_Button_pressed():
	$Enemy.play("attack")
	yield($Enemy, "animation_finished")
	$Enemy.play("idle")
	
