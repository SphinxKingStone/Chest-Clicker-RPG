extends Node

var silver = 0
var inventory = []

class Sorter:
	static func sort_rarity(a, b):
		if ItemsData.ITEM_LEVEL[a.rarity.to_upper()] > ItemsData.ITEM_LEVEL[b.rarity.to_upper()]:
			return true
		return false

func _ready():
	pass 

func get_inventory():
	return inventory

func add_item(item):
	if item == null:
		print_debug("Warning null item in add_item Inventory")
		return
	inventory.append(item)

func remove_item(item):
#	var t1 = inventory[0]
#	var t2 = item
#	print_debug(t1 == t2) # why false???
	inventory.erase(item)

func sort_inventory(sort_method = "sort_rarity", item_categories = []):
	var sorted_inventory = inventory.duplicate(true)
	
	# find out what items should be removed based on item_categories
	if item_categories.size() > 0:
		var wrong_category_type = []
		for item in sorted_inventory:
			if !(item.category in item_categories):
				wrong_category_type.append(item)
		
		# remove items from not yet sorted sorted_inventory
		for wrong_item in wrong_category_type:
			sorted_inventory.erase(wrong_item)
	
	# sort items
	sorted_inventory.sort_custom(Sorter, sort_method)
	return sorted_inventory
