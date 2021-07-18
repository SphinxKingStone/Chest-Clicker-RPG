extends Panel

signal showNewItem

onready var AnimSprite = $AnimatedSprite

func _ready():
	pass

func on_click():
	$ParticlesLeft.emitting = false
	$ParticlesRight.emitting = false
	AnimSprite.play("open")
	yield(get_tree().create_timer(0.55), "timeout")
	$ParticlesLeft.emitting = true
	$ParticlesRight.emitting = true
	yield(get_tree().create_timer(0.55), "timeout")
	emit_signal("showNewItem")


func _on_ChestScene_gui_input(event):
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		if event.is_pressed():
			on_click()
