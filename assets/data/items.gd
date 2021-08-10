extends Node


func _init():
	pass

var weapons = {
	# WHITE CATEGORY
	simple_axe = {
		code = "simple axe",
		name = "Simple Axe",
		image = load("res://assets/images/axes/axe_7.png"),
		category = "One_Handed",
		
		base_stats = {
			attack = [2.5, 5],
		},
		rarity = "WHITE",
	},
	
	wooden_sword = {
		code = "wooden sword",
		name = "Wooden Sword",
		image = load("res://assets/images/swords/sword_6.png"),
		category = "One_Handed",
		
		base_stats = {
			attack = [1, 7],
		},
		rarity = "WHITE",
	},
}

var armour = {
	# WHITE CATEGORY
	leather_chestplate = {
		code = "leather chestplate",
		name = "Leather Chestplate",
		image = load("res://assets/images/armors/armor_17.png"),
		category = "Body_Armour",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "WHITE",
	},
	
	leather_hood = {
		code = "leather hood",
		name = "Leather Hood",
		image = load("res://assets/images/helmets/helmet_83.png"),
		category = "Helmet",
		
		base_stats = {
			defense = [3, 5], 
		},
		rarity = "WHITE",
	},
}

var jewelery = {
	# WHITE CATEGORY
	gold_ring = {
		code = "gold ring",
		name = "Gold Ring",
		image = load("res://assets/images/rings/ring_16.png"),
		category = "Ring",
		
		base_stats = {
			attack = 5,
		},
		rarity = "WHITE",
	},
	
}
