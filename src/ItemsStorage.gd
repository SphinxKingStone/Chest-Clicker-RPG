extends Node


var items_in_category = {
	one_handed = 0,
	two_handed = 0,
	shield = 0,
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
var purple_items = []
var yellow_items = []

func _init():
	for category in ItemsData.ITEM_CATEGORY:
		for item in ItemsData.get(category).values():
			items_in_category[category] += 1
#			self.get(item.rarity.to_lower()+"_items").append(item) # it's the same as match but fancy (It's probably less effective)
			match item.rarity:
				"WHITE":
					white_items.append(item)
				"GREEN":
					green_items.append(item)
				"BLUE":
					blue_items.append(item)
				"PURPLE":
					purple_items.append(item)
				"YELLOW":
					yellow_items.append(item)
