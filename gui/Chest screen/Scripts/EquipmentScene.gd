extends Panel

var ring_selection = false

func _ready():
	for ch in $GridContainer.get_children():
		ch.connect("gui_input", self, "on_click", [ch])
	Character.connect("item_equipped", self, "update_equipment")
	update_equipment()

func sell_item():
	hide()
	pass

func update_equipment():
	for slot in Character.Equipment.get_equipment():
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
			texture_node.get_parent().get_node("shadow").visible = false
			texture_node.texture = Character.Equipment.get_slot(slot).texture
		else:
			texture_node.get_parent().get_node("shadow").visible = true
			texture_node.get_parent().set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS["GREY"])
			texture_node.texture = null
			continue
		
		# Manage slots BG color
		texture_node.get_parent().set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS[Character.Equipment.get_slot(slot).rarity])
		
		$GridContainer/left_ring/SelectionPanel.visible = false
		$GridContainer/right_ring/SelectionPanel.visible = false

func update_silver():
	get_parent().get_node("Amount").text = str(Character.Inventory.silver)

func on_click(event, node):
	if event is InputEventScreenTouch:
		if !event.is_pressed():
			# ring selection part
			if ring_selection:
				$GridContainer/left_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_red.tres"))
				$GridContainer/right_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_red.tres"))
				if node.name == "left_ring" or node.name == "right_ring":
					Character.Equipment.selected_ring = node.name
					node.get_node("SelectionPanel").set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_green.tres"))
			
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

func enable_ring_selection():
	ring_selection = true
	$GridContainer/left_ring/SelectionPanel.visible = true
	$GridContainer/right_ring/SelectionPanel.visible = true
	if Character.Equipment.get_slot("left_ring") == null:
		Character.Equipment.selected_ring = "left_ring"
		$GridContainer/left_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_green.tres"))
		$GridContainer/right_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_red.tres"))
	else:
		Character.Equipment.selected_ring = "right_ring"
		$GridContainer/right_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_green.tres"))
		$GridContainer/left_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_red.tres"))
