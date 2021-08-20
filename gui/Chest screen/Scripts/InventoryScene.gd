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
		match slot:
			"helmet":
				if Inventory.gear[slot] != null:
					$GridContainer/Head/Texture.texture = Inventory.gear[slot].texture
			"weapon_left":
				if Inventory.gear[slot] != null:
					$GridContainer/HandLeft/Texture.texture = Inventory.gear[slot].texture
			"weapon_right":
				if Inventory.gear[slot] != null:
					$GridContainer/HandRight/Texture.texture = Inventory.gear[slot].texture
			"amulet":
				if Inventory.gear[slot] != null:
					$GridContainer/Amulet/Texture.texture = Inventory.gear[slot].texture
			"ring_left":
				if Inventory.gear[slot] != null:
					$GridContainer/RingLeft/Texture.texture = Inventory.gear[slot].texture
			"ring_right":
				if Inventory.gear[slot] != null:
					$GridContainer/RingRight/Texture.texture = Inventory.gear[slot].texture
			"body":
				if Inventory.gear[slot] != null:
					$GridContainer/Body/Texture.texture = Inventory.gear[slot].texture
			"gloves":
				if Inventory.gear[slot] != null:
					$GridContainer/Gloves/Texture.texture = Inventory.gear[slot].texture
			"accessory":
				if Inventory.gear[slot] != null:
					$GridContainer/Accessory/Texture.texture = Inventory.gear[slot].texture
			"boots":
				if Inventory.gear[slot] != null:
					$GridContainer/Boots/Texture.texture = Inventory.gear[slot].texture
