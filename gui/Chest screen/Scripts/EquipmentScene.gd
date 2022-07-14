extends Panel

var ring_selection = false

func _ready():
	for ch in $GridContainer.get_children():
		ch.connect("gui_input", self, "on_click", [ch])
	Character.connect("item_equipped", self, "update_equipment")

func sell_item():
	hide()
	pass

func update_equipment():
	for slot in Character.Equipment.get_equipment():
		var texture_node
		texture_node = get_node(str("GridContainer/" + slot + "/Texture"))
		texture_node.modulate.a = 1.0
		
		# Set item sprite for current slot or remove old sprite if slot is empty
		var item_in_slot = Character.Equipment.get_slot(slot)
		if item_in_slot != null:
			texture_node.get_parent().get_node("shadow").visible = false
			texture_node.texture = item_in_slot.texture
		else:
			texture_node.get_parent().get_node("shadow").visible = true
			texture_node.get_parent().set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS["GREY"])
			texture_node.texture = null
			continue
		
		# Manage slots BG color
		texture_node.get_parent().set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS[Character.Equipment.get_slot(slot).rarity])
	
	var item_in_slot = Character.Equipment.get_slot("left_hand")
	if item_in_slot != null:
		if item_in_slot.category == "two_handed":
			$GridContainer/right_hand/shadow.visible = false
			$GridContainer/right_hand/Texture.texture = item_in_slot.texture
			$GridContainer/right_hand.set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS[item_in_slot.rarity])
			$GridContainer/right_hand/Texture.modulate.a = 0.47

func disable_ring_selection():
	ring_selection = false
	$GridContainer/left_ring/SelectionPanel.visible = false
	$GridContainer/right_ring/SelectionPanel.visible = false

func update_silver():
	get_parent().get_node("Amount").text = str(Character.Inventory.silver)

func on_click(event, node):
	if event is InputEventScreenTouch:
		if !event.is_pressed():
			# ring selection part
			if ring_selection:
				if node.name == "left_ring":
					$GridContainer/left_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_green.tres"))
					$GridContainer/right_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_red.tres"))
					Character.Equipment.selected_ring = node.name
				if node.name == "right_ring":
					$GridContainer/right_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_green.tres"))
					$GridContainer/left_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_red.tres"))
					Character.Equipment.selected_ring = node.name
			
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
	if Character.Equipment.selected_ring == "right_ring":
		$GridContainer/right_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_green.tres"))
		$GridContainer/left_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_red.tres"))
	else:
		$GridContainer/left_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_green.tres"))
		$GridContainer/right_ring/SelectionPanel.set("custom_styles/panel", load("res://assets/StyleBoxes/ring_selection_red.tres"))

func set_equipment_visability(equpment_visability):
	var tw = Tween.new()
	add_child(tw) 
	tw.start()
	if equpment_visability:
		tw.interpolate_property(self, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.06, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		show()
	else:
		tw.interpolate_property(self, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.06, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	yield(tw, "tween_all_completed")
	if !equpment_visability:
		hide()
	remove_child(tw)
