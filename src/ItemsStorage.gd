extends Node


var items_in_category = {
	One_Handed = 0,
	Two_Handed = 0,
	Body_Armour = 0,
	Helmet = 0,
	Gloves = 0,
	Boots = 0,
	Ring = 0,
	Amulet = 0,
	Accessory = 0,
}

var white_items = []
var green_items = []

func _init():
	for i in Items.weapons.values():
		items_in_category[i.category] += 1
		match i.rarity:
			"WHITE":
				white_items.append(i)
			"GREEN":
				green_items.append(i)
		
	
	for i in Items.armour.values():
		items_in_category[i.category] += 1
		match i.rarity:
			"WHITE":
				white_items.append(i)
			"GREEN":
				green_items.append(i)
		
	
	for i in Items.jewelery.values():
		items_in_category[i.category] += 1
		match i.rarity:
			"WHITE":
				white_items.append(i)
			"GREEN":
				green_items.append(i)
		
	
