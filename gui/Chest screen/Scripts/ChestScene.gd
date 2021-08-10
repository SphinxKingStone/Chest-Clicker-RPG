extends Panel

onready var AnimSprite = $AnimatedSprite

func _ready():
	$AnimatedSprite.connect("animation_finished", self, "set_frame_and_stop", [$AnimatedSprite])
	pass

func on_click():
	handle_particles()
	AnimSprite.play("open")
	#yield(get_tree().create_timer(1.1), "timeout")
	get_tree().create_timer(1.1).connect("timeout", self, 'show_item')

func show_item():
	var item_scene = get_parent().get_node("NewItemScene")
	var item = ItemGenerator.generate_item()
	item_scene.show_item(item)

func set_frame_and_stop(aSprite, frame = 0):
	if aSprite.is_playing():
		aSprite.stop()
	aSprite.frame = frame

func _on_Panel_gui_input(event):
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		if !event.is_pressed():
			on_click()

func handle_particles():
	$ParticlesLeft.emitting = true
	$ParticlesRight.emitting = true
	yield(get_tree().create_timer(2), "timeout")
	$ParticlesLeft.emitting = false
	$ParticlesRight.emitting = false
