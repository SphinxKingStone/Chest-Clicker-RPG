extends Node


var items_in_category = {
	One_Handed = 0,
	Body_Armour = 0,
	Helmet = 0,
	Ring = 0,
}

var white_items = []

func _init():
	for i in Items.weapons.values():
		items_in_category[i.category] += 1
		if i.rarity == "WHITE":
			white_items.append(i)
		
	
	for i in Items.armour.values():
		items_in_category[i.category] += 1
		if i.rarity == "WHITE":
			white_items.append(i)
		
	
	for i in Items.jewelery.values():
		items_in_category[i.category] += 1
		if i.rarity == "WHITE":
			white_items.append(i)
		
	
