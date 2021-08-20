extends Panel

onready var AnimSprite = $AnimatedSprite

var openning = false

func _ready():
	AnimSprite.connect("animation_finished", self, "set_frame_and_stop", [AnimSprite])
	pass

func on_click():
	var item_scene = get_parent().get_node("NewItemScene")
	if item_scene.visible or openning:
		return
	openning = true
	ItemGenerator.generate_item()
	emit_particles(ItemGenerator.item.rarity)
	AnimSprite.play("open")
	yield(get_tree().create_timer(1.2), "timeout")
	item_scene.show_item(ItemGenerator.item)
	openning = false

func set_frame_and_stop(aSprite, frame = 0):
	if aSprite.is_playing():
		aSprite.stop()
	aSprite.frame = frame

func _on_Panel_gui_input(event):
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		if !event.is_pressed():
			on_click()

func emit_particles(rarity):
	if rarity == "WHITE":
		return
	
	var left = $ParticlesLeft.duplicate()
	var right = $ParticlesRight.duplicate()
	self.add_child(left)
	self.add_child(right)
	
	match rarity:
		"GREEN":
			left.set_process_material((load("res://assets/particle materials/Green left.tres")))
			right.set_process_material((load("res://assets/particle materials/Green right.tres")))
	
	right.get_process_material().direction.x = 90
	left.emitting = true
	right.emitting = true
	yield(get_tree().create_timer(2), "timeout")
	left.emitting = false
	right.emitting = false
	yield(get_tree().create_timer(left.lifetime), "timeout")
	left.queue_free()
	right.queue_free()
