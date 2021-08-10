extends Node


func _init():
	pass

var weapons = {
	# WHITE CATEGORY
	simple_axe = {
		code = "simple axe",
		image = load("res://assets/images/axes/axe_7.png"),
		category = "One_Handed",
		
		base_stats = {
			attack = 2,
			bonus_rarity = 0.5,
		},
		rarity = "WHITE",
		cost = 8,
	},
	
	wooden_sword = {
		code = "wooden sword",
		image = load("res://assets/images/swords/sword_6.png"),
		category = "One_Handed",
		
		base_stats = {
			attack = 1.5,
			bonus_rarity = 0.65,
		},
		rarity = "WHITE",
		cost = 7,
	},
}

var armour = {
	# WHITE CATEGORY
	leather_chestplate = {
		code = "leather chestplate",
		image = load("res://assets/images/armors/armor_17.png"),
		category = "Body_Armour",
		
		base_stats = {
			defense = 6,
			bonus_rarity = 1.4,
		},
		rarity = "WHITE",
		cost = 10,
	},
	
	leather_hood = {
		code = "leather hood",
		image = load("res://assets/images/helmets/helmet_83.png"),
		category = "Helmet",
		
		base_stats = {
			defense = 4,
			bonus_rarity = 1.2,
		},
		rarity = "WHITE",
		cost = 8,
	},
}
