extends Node


var items_in_category = {
	one_handed = 0,
	two_handed = 0,
	body_armour = 0,
	helmet = 0,
	gloves = 0,
	boots = 0,
	ring = 0,
	amulet = 0,
	accessory = 0,
}

var white_items = []
var green_items = []
var blue_items = []

func _init():
	for i in ItemsData.weapons.values():
		items_in_category[i.category] += 1
		match i.rarity:
			"WHITE":
				white_items.append(i)
			"GREEN":
				green_items.append(i)
			"BLUE":
				blue_items.append(i)
		
	
	for i in ItemsData.armour.values():
		items_in_category[i.category] += 1
		match i.rarity:
			"WHITE":
				white_items.append(i)
			"GREEN":
				green_items.append(i)
			"BLUE":
				blue_items.append(i)
		
	
	for i in ItemsData.jewelery.values():
		items_in_category[i.category] += 1
		match i.rarity:
			"WHITE":
				white_items.append(i)
			"GREEN":
				green_items.append(i)
			"BLUE":
				blue_items.append(i)
		
	
