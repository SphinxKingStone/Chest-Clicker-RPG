extends Node2D

signal click

onready var AnimSprite = $AnimatedSprite

func _ready():
	connect("click", self, "on_click")

func _input(event):
	if event is InputEventScreenTouch or InputEventMouseButton and event.is_pressed():
		if $Panel.get_rect().has_point(to_local(event.position)):
			emit_signal("click")

func on_click():
	AnimSprite.frame = 0
	AnimSprite.play("open")
	yield(get_tree().create_timer(0.55), "timeout")
	$ParticlesLeft.emitting = true
	$ParticlesRight.emitting = true
