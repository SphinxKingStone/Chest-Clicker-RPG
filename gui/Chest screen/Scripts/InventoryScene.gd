extends Panel

var last_mouse_pos
var selected_slot

func _ready():
	for bt in $Menu/HBox.get_children():
		bt.connect("pressed", self, "menu_button_pressed", [bt])
	
	for bt in $PlaceForButtons/HBoxContainer.get_children():
		bt.connect("pressed", self, "sort_button_pressed", [bt])

# clears inventory, sorts items and shows them
func update_inventory(sort_method = "sort_rarity", item_categories = []):
	# clearing all slots
	clear_inventory()
	
	# checking out buttons
	for bt in $PlaceForButtons/HBoxContainer.get_children():
		if bt.name != "all" and bt.pressed:
			item_categories.append(bt.name)
	if item_categories.size() == 0:
		clear_inventory()
		return
	
	# sorting items
	var sorted_inventory = Character.sort_inventory(sort_method, item_categories)
	
	# adding sorted items to inventory
	for item in sorted_inventory:
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
		$Menu.show()
		$Menu.rect_position = last_mouse_pos
		$Menu/HBox/Equip.disabled = false
		selected_slot = slot
		
		# disable "equip" button if you have two handed and got shield
		if slot.get_meta("item").category == "shield":
			if Character.get_equipment()["left_hand"] != null:
				$Menu/HBox/Equip.disabled = Character.get_equipment()["left_hand"].category == "two_handed"
		
		# enable ring selection
#		if slot.get_meta("item").category == "ring":
#		get_parent().get_node("EquipmentScene").enable_ring_selection()
		
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
			Character.remove_item(item)
			update_inventory()

func sort_button_pressed(button):
	# "all" button functionality
	if button.name == "all":
		if button.pressed:
			for bt in $PlaceForButtons/HBoxContainer.get_children():
				if bt.name != "all":
					bt.pressed = button.pressed
			update_inventory()
			return
		else:
			for bt in $PlaceForButtons/HBoxContainer.get_children():
				if bt.name != "all":
					bt.pressed = false
			clear_inventory()
			return
	
	# if it's not an "all" button being unpressed then we should unpress "all"
	if !button.pressed:
		$PlaceForButtons/HBoxContainer/all.pressed = false
	
	# if all buttons pressed "all" button should be pressed as well
	var all_pressed = true
	for bt in $PlaceForButtons/HBoxContainer.get_children():
		if bt.name != "all" and !bt.pressed:
			all_pressed = false
			break
	if all_pressed:
		$PlaceForButtons/HBoxContainer/all.pressed = true
	
	update_inventory()

func clear_inventory():
	# clearing all slots
	for slot in $ScrollContainer/GridContainer.get_children():
		if slot.visible:
			$ScrollContainer/GridContainer.remove_child(slot)
			slot.queue_free()

func show_inventory():
	show()
	get_parent().get_node("EquipmentScene").enable_ring_selection()
