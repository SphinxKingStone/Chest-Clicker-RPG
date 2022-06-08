extends Panel

var last_mouse_pos
var selected_slot

func _ready():
	for bt in $Menu/HBox.get_children():
		bt.connect("pressed", self, "menu_button_pressed", [bt])

func update_inventory():
	# clear all slots
	for slot in $ScrollContainer/GridContainer.get_children():
		if slot.visible:
			$ScrollContainer/GridContainer.remove_child(slot)
	
	# adding items without sorting
	for item in Character.Inventory.get_inventory():
		var new_slot = $ScrollContainer/GridContainer/Slot.duplicate()
		new_slot.connect("gui_input", self, "slot_input", [new_slot])
		new_slot.set_meta("item", item)
		new_slot.visible = true
		$ScrollContainer/GridContainer.add_child(new_slot)
		new_slot.get_node("Texture").texture = item.texture
		new_slot.set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS[item.rarity])

func slot_input(event, slot):
	if event is InputEventScreenTouch and !event.is_pressed():
		last_mouse_pos = get_local_mouse_position()
		selected_slot = slot
		$Menu.show()
		$Menu.rect_position = last_mouse_pos
		
		# moving info menu it's going to spawn outside of the screen
		if last_mouse_pos.x > self.rect_size.x / 2:
			$Menu.rect_position.x -= $Menu.rect_size.x
		if $Menu.rect_size.y + last_mouse_pos.y > self.rect_size.y:
			$Menu.rect_position.y -= $Menu.rect_size.y

func menu_button_pressed(button):
	match button.name:
		"Info":
			var itemPreview = ResourceManager.NODES["ITEM_PREVIEW"].instance()
			self.add_child(itemPreview)
			ResourceManager.item_info_children.append(itemPreview)
			var item = selected_slot.get_meta("item")
			itemPreview.set_item_data(item)
			itemPreview.rect_position = last_mouse_pos
			
			# moving item info if it's going to spawn outside of  the screen
			if last_mouse_pos.x + itemPreview.rect_size.x > self.rect_size.x:
				itemPreview.rect_position.x -= itemPreview.rect_size.x
			if itemPreview.rect_size.y + last_mouse_pos.y > self.rect_size.y:
				itemPreview.rect_position.y -= itemPreview.rect_size.y
			print_debug(itemPreview.rect_position)
			$Menu.hide()
		"Equip":
			var item = selected_slot.get_meta("item")
			Character.equip_item(item)
			Character.Inventory.remove_item(item)
			update_inventory()
