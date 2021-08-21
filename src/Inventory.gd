extends Node

var gear = {
	helmet = null,
	weapon_left = null,
	weapon_right = null,
	amulet = null,
	ring_left = null,
	ring_right = null,
	body = null,
	gloves = null,
	accessory = null,
	boots = null,
}

var silver = 0
var inventory = []

func _ready():
	pass 

func show_new_item(item):
	pass

func equip_item(item, slot = ""):
	match item.category:
		"Body_Armour":
			if gear.body != null:
				show_new_item(gear.body)
			gear.body = item
		"Helmet":
			if gear.helmet != null:
				show_new_item(gear.helmet)
			gear.helmet = item
		"Gloves":
			if gear.gloves != null:
				show_new_item(gear.gloves)
			gear.gloves = item
		"Boots":
			if gear.boots != null:
				show_new_item(gear.boots)
			gear.boots = item
		"Amulet":
			if gear.amulet != null:
				show_new_item(gear.amulet)
			gear.amulet = item
		"Accessory":
			if gear.accessory != null:
				show_new_item(gear.accessory)
			gear.accessory = item
	
	if slot != "":
		match slot:
			"Left_Hand":
				if gear.weapon_left != null:
					show_new_item(gear.weapon_left)
				gear.weapon_left = item
			"Right_Hand":
				if gear.weapon_right != null:
					show_new_item(gear.weapon_right)
				gear.weapon_right = item
			"Left_Ring":
				if gear.ring_left != null:
					show_new_item(gear.ring_left)
				gear.ring_left = item
			"Right_Ring":
				if gear.ring_right != gear.ring_right:
					show_new_item(item)
				gear.ring_right = item
			"Two_Hands":
				if gear.weapon_left != null:
					show_new_item(gear.weapon_left)
				if gear.weapon_right != null:
					show_new_item(gear.weapon_right)
				gear.weapon_left = item
				gear.weapon_right = null
	else:
		match item.category:
			"Two_Handed":
#				if gear.weapon_left != null:
#					show_new_item(gear.weapon_left)
#				elif gear.weapon_right != null:
#					show_new_item(gear.weapon_right)
				gear.weapon_left = item
				gear.weapon_right = null
			"One_Handed":
				if gear.weapon_left == null:
					gear.weapon_left = item
				elif (gear.weapon_left != null) and gear.weapon_right == null:
					if gear.weapon_left.category == "Two_Handed":
						pass
#						show_new_item(gear.weapon_left)
#						gear.weapon_right = item
					else:
						gear.weapon_right = item
				elif (gear.weapon_left != null) and gear.weapon_right != null:
					show_new_item(gear.weapon_left)
					gear.weapon_left = item
			"Ring":
				if gear.ring_left == null:
					gear.ring_left = item
				elif gear.ring_right == null:
					gear.ring_right = item
				elif gear.ring_left != null:
					show_new_item(gear.ring_left)
					gear.ring_left = item
				elif gear.ring_right != null:
					show_new_item(gear.ring_right)
					gear.ring_right = item
