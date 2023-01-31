extends Panel

onready var AnimSprite = $AnimatedSprite

signal chest_opened

var openning = false

func _ready():
	AnimSprite.connect("animation_finished", self, "set_frame_and_stop", [AnimSprite])
	pass

func on_click():
	var item_scene = get_parent().get_node("NewItemScene")
	if item_scene.visible or openning:
		return
	openning = true
	var new_item = ItemGenerator.generate_item()
	emit_particles(new_item.rarity)
	AnimSprite.play()
	var creak = load("res://assets/Sounds/Sounds/creak1.wav")
	Audio.play_sound(creak)
	yield(AnimSprite, "animation_finished")
	openning = false
	emit_signal("chest_opened")
	Progress.increase_total_chests()
	if ItemGenerator.gold_chest:
		AnimSprite.animation = "open_gold"
	else:
		AnimSprite.animation = "12"

func set_frame_and_stop(aSprite, frame = 0):
	if aSprite.is_playing():
		aSprite.stop()
	aSprite.frame = frame

func _on_Panel_gui_input(event):
	if event is InputEventScreenTouch:
		if !event.is_pressed():
			on_click()

func emit_particles(rarity):
	if rarity == "WHITE":
		return
	
	var left = $ParticlesLeft.duplicate()
	var right = $ParticlesRight.duplicate()
	self.add_child(left)
	self.add_child(right)
	
	var new_mat = left.get("process_material").duplicate()
	new_mat.set("color_ramp", ResourceManager.PARTICLES_COLORS[rarity])
	left.set("process_material", new_mat)
	right.set("process_material", new_mat.duplicate()) # I need duplication here so that later I can change direction separately
	
	left.get_process_material().direction.x = -90
	right.get_process_material().direction.x = 90
	
	left.emitting = true
	right.emitting = true
	yield(get_tree().create_timer(2), "timeout")
	left.emitting = false
	right.emitting = false
	yield(get_tree().create_timer(left.lifetime), "timeout")
	left.queue_free()
	right.queue_free()
