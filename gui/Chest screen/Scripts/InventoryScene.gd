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
	if event is InputEventScreenTouch and event.is_pressed():
		last_mouse_pos = get_local_mouse_position()
		selected_slot = slot
		$Menu.visible = !$Menu.visible
		$Menu.rect_position = last_mouse_pos
		
		# moving info menu to the left if it's going to spawn outside of  the screen
		if last_mouse_pos.x > self.rect_size.x / 2:
			$Menu.rect_position.x -= $Menu.rect_size.x

func menu_button_pressed(button):
	match button.name:
		"Info":
			if ResourceManager.item_info_children.size() > 0:
				ResourceManager.clear_item_info_children()
				return
			var itemPreview = ResourceManager.NODES["ITEM_PREVIEW"].instance()
			get_parent().add_child(itemPreview)
			ResourceManager.item_info_children.append(itemPreview)
			itemPreview.set_item_data(selected_slot.get_meta("item"))
			itemPreview.rect_position = $Local_node.to_global(last_mouse_pos)
			
			# moving item info to the left if it's going to spawn outside of  the screen
			if last_mouse_pos.x + itemPreview.rect_size.x > self.rect_size.x:
				itemPreview.rect_position.x -= itemPreview.rect_size.x
			
			$Menu.visible = false
