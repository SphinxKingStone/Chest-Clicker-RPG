extends Panel


func _ready():
	#warning-ignore:return_value_discarded
	for ch in get_children():
		ch.connect("pressed", self, "toggle_button", [ch])
	toggle_button($Equipment)

func toggle_button(button):
	if button.pressed:
		match button.name:
			"Equipment":
				get_parent().set_scene_visability(get_parent().get_node("EquipmentScene"), true)
			"Inventory":
				get_parent().get_node("InventoryScene").update_inventory()
				Audio.play_sound(ResourceManager.SOUNDS["OPEN_INVENTORY"])
				get_parent().set_scene_visability(get_parent().get_node("ChestScene"), false)
				yield(get_parent().set_scene_visability(get_parent().get_node("InventoryScene"), true), "completed")
				get_parent().get_node("EquipmentScene").set_ring_selection_visability(true)
			"Achievements":
				SceneTransition.change_scene("res://gui/UI/Scenes/AchievementsScene.tscn")
			"Exploring":
				SceneTransition.change_scene("res://gui/Exploring screen/Scenes/ExploringScene.tscn")
			"Settings":
				get_parent().set_scene_visability(get_parent().get_node("SettingsScene"), true)
				button.pressed = false
				return
		
		show_button_pressed(button, true)
	else:
		match button.name:
			"Equipment":
				get_parent().set_scene_visability(get_parent().get_node("EquipmentScene"), false)
			"Inventory":
				get_parent().set_scene_visability(get_parent().get_node("ChestScene"), true)
				yield(get_parent().set_scene_visability(get_parent().get_node("InventoryScene"), false), "completed")
				get_parent().get_node("EquipmentScene").set_ring_selection_visability(false)
			"Settings":
				get_parent().set_scene_visability(get_parent().get_node("SettingsScene"), false)
				return
		
		show_button_pressed(button, false)

func show_button_pressed(button, pressed):
	var bg = button.get_node("Background")
	if pressed:
		button.rect_position += Vector2(2, 2)
		bg.rect_position -= Vector2(2, 2)
		bg.set("custom_styles/panel", load("res://assets/StyleBoxes/button_background_pressed.tres"))
	else:
		button.rect_position -= Vector2(2, 2)
		bg.rect_position += Vector2(2, 2)
		bg.set("custom_styles/panel", load("res://assets/StyleBoxes/button_background_normal.tres"))
