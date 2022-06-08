extends Panel

func _ready():
	for ch in $GridContainer.get_children():
		ch.connect("gui_input", self, "on_click", [ch])
	Character.connect("item_equipped", self, "update_equipment")

func sell_item():
	hide()
	pass

func update_equipment():
	for slot in Character.Equipment.get_gear():
		var texture_node
		match slot:
			"helmet":
				texture_node = $GridContainer/Helmet/Texture
			"left_hand":
				texture_node = $GridContainer/left_hand/Texture
			"right_hand":
				texture_node = $GridContainer/right_hand/Texture
			"amulet":
				texture_node = $GridContainer/Amulet/Texture
			"left_ring":
				texture_node = $GridContainer/left_ring/Texture
			"right_ring":
				texture_node = $GridContainer/right_ring/Texture
			"body_armour":
				texture_node = $GridContainer/body_armour/Texture
			"gloves":
				texture_node = $GridContainer/Gloves/Texture
			"accessory":
				texture_node = $GridContainer/Accessory/Texture
			"boots":
				texture_node = $GridContainer/Boots/Texture
		
		# Set item sprite for current slot or remove old sprite if slot is empty
		if Character.Equipment.get_slot(slot) != null:
			texture_node.texture = Character.Equipment.get_slot(slot).texture
		else:
			texture_node.get_parent().set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS["GREY"])
			texture_node.texture = null
			continue
		
		# Manage slots BG color
		texture_node.get_parent().set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS[Character.Equipment.get_slot(slot).rarity])

func update_silver():
	get_parent().get_node("TopSide/Silver/Amount").text = str(Character.Inventory.silver)

func on_click(event, node):
	if event is InputEventScreenTouch:
		if !event.is_pressed():
			if Character.Equipment.get_slot(node.name.to_lower()) == null:
				return
			if ResourceManager.item_info_children.size() > 0:
				ResourceManager.clear_item_info_children()
				return
			var itemPreview = ResourceManager.NODES["ITEM_PREVIEW"].instance()
			get_parent().add_child(itemPreview)
			ResourceManager.item_info_children.append(itemPreview)
			itemPreview.set_item_data(Character.Equipment.get_slot(node.name.to_lower()))
			itemPreview.rect_position = get_global_mouse_position()
			itemPreview.rect_position.x -= itemPreview.rect_size.x
