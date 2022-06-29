extends Node

var selected_ring = ""

var gear = {
	helmet = null,
	left_hand = null,
	right_hand = null,
	amulet = null,
	left_ring = null,
	right_ring = null,
	body_armour = null,
	gloves = null,
	accessory = null,
	boots = null,
}

func _ready():
	pass 

func show_new_item(item):
	pass

func get_equipment():
	return gear

func set_equipment(eq):
	gear = eq

func get_slot(slot):
	if gear.has(slot):
		return gear[slot]

# equips item and return items that were previously equipped 
func equip_item(item):
	var old_items = [] # needs to be an array because we can unequip one handed AND shield at once
	var slot = figure_out_slot(item)
	if gear[slot] != null:
		old_items.append(gear[slot].duplicate(true))
	
	# equipping item
	gear[slot] = item
	
	# unequipping shield if two handed
	if item.category == "two_handed":
		if gear["right_hand"] != null:
			old_items.append(gear["right_hand"])
		gear["right_hand"] = null
	
	return old_items

# returns gear slot name depending on item category and slot availability
func figure_out_slot(item):
	var slot
	if gear.has(item.category):
		slot = item.category
	else:
		match item.category:
			"one_handed":
				slot = "left_hand"
			"two_handed":
				slot = "left_hand"
			"shield":
				slot = "right_hand"
			"ring":
				if selected_ring == "":
					slot = "right_ring"
					print_debug("selected_ring is null warning")
				slot = selected_ring
	return slot
