extends Panel

signal showNewItem

onready var AnimSprite = $AnimatedSprite

func _ready():
	pass

func _input(event):
	if event is InputEventScreenTouch or InputEventMouseButton and event.is_pressed():
		if $helper/Panel.get_rect().has_point($helper.to_local(event.position)):
			on_click()

func on_click():
	$ParticlesLeft.emitting = false
	$ParticlesRight.emitting = false
	AnimSprite.play("open")
	yield(get_tree().create_timer(0.55), "timeout")
	$ParticlesLeft.emitting = true
	$ParticlesRight.emitting = true
	yield(get_tree().create_timer(0.55), "timeout")
	emit_signal("showNewItem")
