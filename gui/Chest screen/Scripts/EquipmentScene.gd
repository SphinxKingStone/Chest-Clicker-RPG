extends Panel

var childs = []

func _ready():
	for ch in $GridContainer.get_children():
		ch.connect("gui_input", self, "on_click", [ch])

func sell_item():
	hide()
	pass

func update_equipment():
	for slot in Character.Equipment.get_gear():
		var texture_node
		match slot:
			"helmet":
				texture_node = $GridContainer/Helmet/Texture
			"weapon_left":
				texture_node = $GridContainer/Weapon_Left/Texture
			"weapon_right":
				texture_node = $GridContainer/Weapon_Right/Texture
			"amulet":
				texture_node = $GridContainer/Amulet/Texture
			"ring_left":
				texture_node = $GridContainer/Ring_Left/Texture
			"ring_right":
				texture_node = $GridContainer/Ring_Right/Texture
			"body":
				texture_node = $GridContainer/Body/Texture
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
			if childs.size() > 0:
				clear_childs()
				return
			var itemPreview = ResourceManager.NODES["ITEM_PREVIEW"].instance()
			get_parent().add_child(itemPreview)
			childs.append(itemPreview)
			itemPreview.set_item_data(Character.Equipment.get_slot(node.name.to_lower()))
			itemPreview.rect_position = get_global_mouse_position()
			itemPreview.rect_position.x -= itemPreview.rect_size.x

func clear_childs():
	for i in childs:
		get_parent().remove_child(i)
		childs.erase(i)
