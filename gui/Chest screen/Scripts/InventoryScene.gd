extends Panel

func _ready():
	pass 


func sell_item():
	hide()
	pass
#	One_Handed = 0,
#	Two_Handed = 0,
#	Body_Armour = 0,
#	Helmet = 0,
#	Gloves = 0,
#	Boots = 0,
#	Ring = 0,
#	Amulet = 0,
#	Accessory = 0,

func update_inventory():
	for slot in Inventory.gear:
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
		if Inventory.gear[slot] != null:
			texture_node.texture = Inventory.gear[slot].texture
		else:
			texture_node.get_parent().set("custom_styles/panel", load("res://assets/StyleBoxes/light_gray_item_bg.tres"))
			texture_node.texture = null
			continue
		
		# Manage slots BG color
		match Inventory.gear[slot].rarity:
			"WHITE": #gray
				texture_node.get_parent().set("custom_styles/panel", load("res://assets/StyleBoxes/gray_item_bg.tres"))
			"GREEN":
				texture_node.get_parent().set("custom_styles/panel", load("res://assets/StyleBoxes/green_item_bg.tres"))
			

func update_silver():
	get_parent().get_node("TopSide/Silver/Amount").text = str(Inventory.silver)
