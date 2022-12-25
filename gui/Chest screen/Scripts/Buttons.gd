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
		
		#makes bg darker
		var bg = button.get_node("Background")
		bg.set("custom_styles/panel", load("res://assets/StyleBoxes/button_background_pressed.tres"))
		
		#shifts icon down
		button.rect_position += Vector2(2, 2)
		bg.rect_position -= Vector2(2, 2)
	else:
		match button.name:
			"Equipment":
				get_parent().set_scene_visability(get_parent().get_node("EquipmentScene"), false)
			"Inventory":
				get_parent().set_scene_visability(get_parent().get_node("ChestScene"), true)
				yield(get_parent().set_scene_visability(get_parent().get_node("InventoryScene"), false), "completed")
				get_parent().get_node("EquipmentScene").set_ring_selection_visability(false)
		
		#makes bg lighter
		var bg = button.get_node("Background")
		bg.set("custom_styles/panel", load("res://assets/StyleBoxes/button_background_normal.tres"))
		
		#shifts icon back up
		button.rect_position -= Vector2(2, 2)
		bg.rect_position += Vector2(2, 2)
