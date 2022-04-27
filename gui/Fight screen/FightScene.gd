extends Control


func _ready():
	$Character.connect("frame_changed", self, "player_attack_frame")
	pass 

func _on_AttackDown_pressed():
	$Character.play("attack_down")
	yield($Character, "animation_finished")
	$Character.play("idle")


func _on_AttackMid_pressed():
	$Character.play("attack_mid")
	yield($Character, "animation_finished")
	$Character.play("idle")


func _on_AttackUp_pressed():
	$Character.play("attack_up")
	yield($Character, "animation_finished")
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
			if $Character.frame == 3:
				$Enemy.play("hit")
				yield($Enemy, "animation_finished")
				$Enemy.play("idle")
