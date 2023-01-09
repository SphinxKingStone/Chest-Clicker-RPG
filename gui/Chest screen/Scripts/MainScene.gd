extends Control

func _init():
	OS.window_size = Vector2(360*1.5, 640*1.5) # this
	OS.window_position.y = 100 # and this goes into main menu scene
	TranslationServer.set_locale(Settings.language)
	
	self.connect("tree_exiting", SaveManager, "save_game")

func _ready():
	$EquipmentScene.update_equipment()
	$Amount.text = str(Character.Inventory.silver)
	Audio.play_random_music()
	Achievements.connect("new_achievement", self, "new_achievement")
	ItemGenerator.update_min_number()
	$GearLevel.update_bar()
	Character.update_stats()
	$StatsScene.update_stats()

func _input(event):
	if event is InputEventScreenTouch:
		if !event.is_pressed():
			ResourceManager.clear_item_info_children()
			if !$InventoryScene/Menu/HBox/Info.pressed:
				$InventoryScene/Menu.hide()

func _on_clr_save_pressed():
	SaveManager.clear_save()
	var tw = Tween.new()
	add_child(tw) 
	tw.start()
#	var qqq = $Background.material
#	qqq.set_shader_param('topright', Color(0,0,0,0))
	while true:
		var corners = ["shader_param/topright", "shader_param/topleft", "shader_param/bottomright", "shader_param/bottomleft"]
		var corner = corners[ItemGenerator.rng.randi_range(0, 3)]
		
		var speed = ItemGenerator.rng.randi_range(2.5, 6)
		tw.interpolate_property($Background.get_material(), corner, Color(0,0,0,1), Color(0,0,0,0.15), speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		yield(tw, "tween_completed")
		speed = ItemGenerator.rng.randi_range(2.5, 6)
		tw.interpolate_property($Background.get_material(), corner, Color(0,0,0,0.15), Color(0,0,0,1), speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		yield(tw, "tween_completed")
	remove_child(tw)

func new_achievement(ach):
	var pop_up = ResourceManager.NODES["ACHIEVEMENTPOPUP"].instance()
#	pop_up.body_text = str(tr(ach.name) + ": " + tr(ach.description).to_lower())
	pop_up.head_text = tr(ach.name)
	pop_up.body_text = tr(ach.description)
	add_child(pop_up)
	pop_up.rect_position.y -= pop_up.rect_size.y
	pop_up.rect_position.x = 100
	pop_up.appear()

func set_scene_visability(scene, visability, speed = 0.075):
	var tw = Tween.new()
	add_child(tw) 
	tw.start()
	if visability:
		tw.interpolate_property(scene, "modulate", Color(1,1,1,0), Color(1,1,1,1), speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		scene.show()
	else:
		tw.interpolate_property(scene, "modulate", Color(1,1,1,1), Color(1,1,1,0), speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	yield(tw, "tween_all_completed")
	if !visability:
		scene.hide()
	remove_child(tw)
