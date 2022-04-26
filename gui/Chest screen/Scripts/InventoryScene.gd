extends Panel

func _ready():
	pass 


func sell_item():
	hide()
	pass

func update_inventory():
	for slot in Character.Inventory.get_gear():
		var texture_node
		match slot:
			"helmet":
				texture_node = $GridContainer/Head/Texture
			"weapon_left":
				texture_node = $GridContainer/HandLeft/Texture
			"weapon_right":
				texture_node = $GridContainer/HandRight/Texture
			"amulet":
				texture_node = $GridContainer/Amulet/Texture
			"ring_left":
				texture_node = $GridContainer/RingLeft/Texture
			"ring_right":
				texture_node = $GridContainer/RingRight/Texture
			"body":
				texture_node = $GridContainer/Body/Texture
			"gloves":
				texture_node = $GridContainer/Gloves/Texture
			"accessory":
				texture_node = $GridContainer/Accessory/Texture
			"boots":
				texture_node = $GridContainer/Boots/Texture
		
		# Set item sprite for current slot or remove old sprite if slot is empty
		if Character.Inventory.get_slot(slot) != null:
			texture_node.texture = Character.Inventory.get_slot(slot).texture
		else:
			texture_node.get_parent().set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS["GREY"])
			texture_node.texture = null
			continue
		
		# Manage slots BG color
		texture_node.get_parent().set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS[Character.Inventory.get_slot(slot).rarity])

func update_silver():
	get_parent().get_node("TopSide/Silver/Amount").text = str(Character.Inventory.silver)
