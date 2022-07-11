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
				get_parent().get_node("EquipmentScene").show()
			"Inventory":
				get_parent().get_node("InventoryScene").update_inventory()
				get_parent().get_node("InventoryScene").show_inventory()
				Audio.play_sound(ResourceManager.SOUNDS["OPEN_INVENTORY"])
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
				get_parent().get_node("EquipmentScene").hide()
			"Inventory":
				get_parent().get_node("InventoryScene").hide_inventory()
		
		#makes bg lighter
		var bg = button.get_node("Background")
		bg.set("custom_styles/panel", load("res://assets/StyleBoxes/button_background_normal.tres"))
		
		#shifts icon back up
		button.rect_position -= Vector2(2, 2)
		bg.rect_position += Vector2(2, 2)
