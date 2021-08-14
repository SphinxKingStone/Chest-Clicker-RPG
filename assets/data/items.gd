extends Node


func _init():
	pass

var weapons = {
	# WHITE CATEGORY
	simple_axe = {
		code = "simple axe",
		name = tr("Simple Axe"),
		image = load("res://assets/images/axes/axe_7.png"),
		category = "One_Handed",
		
		base_stats = {
			attack = [2.5, 5],
		},
		rarity = "WHITE",
	},
	
	wooden_sword = {
		code = "wooden sword",
		name = tr("Wooden Sword"),
		image = load("res://assets/images/swords/sword_6.png"),
		category = "One_Handed",
		
		base_stats = {
			attack = [1, 7],
		},
		rarity = "WHITE",
	},
	
	copper_dagger = {
		code = "copper dagger",
		name = tr("Copper Dagger"),
		image = load("res://assets/images/swords/sword_86.png"),
		category = "One_Handed",
		
		base_stats = {
			attack = [2, 4],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	iron_sword = {
		code = "iron sword",
		name = tr("Iron Sword"),
		image = load("res://assets/images/swords/sword_55.png"),
		category = "Two_Handed",
		
		base_stats = {
			attack = [6, 12],
		},
		rarity = "GREEN",
	}
}

var armour = {
	# WHITE CATEGORY
	leather_chestplate = {
		code = "leather chestplate",
		name = tr("Leather Chestplate"),
		image = load("res://assets/images/armors/armor_17.png"),
		category = "Body_Armour",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "WHITE",
	},
	
	leather_hood = {
		code = "leather hood",
		name = tr("Leather Hood"),
		image = load("res://assets/images/helmets/helmet_83.png"),
		category = "Helmet",
		
		base_stats = {
			defense = [3, 5], 
		},
		rarity = "WHITE",
	},
	
	leather_gloves = {
		code = "leather gloves",
		name = tr("Leather Gloves"),
		image = load("res://assets/images/gloves/glove_1.png"),
		category = "Gloves",
		
		base_stats = {
			defense = [0.5, 1.5], 
		},
		rarity = "WHITE",
	},
	
	leather_boots = {
		code = "leather boots",
		name = tr("Leather Boots"),
		image = load("res://assets/images/shoes/shoe_15.png"),
		category = "Boots",
		
		base_stats = {
			defense = [1, 3], 
		},
		rarity = "WHITE",
	},
}

var jewelery = {
	# WHITE CATEGORY
	gold_ring = {
		code = "gold ring",
		name = tr("Gold Ring"),
		image = load("res://assets/images/rings/ring_16.png"),
		category = "Ring",
		
		base_stats = {
			attack = 5,
		},
		rarity = "WHITE",
	},
	
	old_medal = {
		code = "old medal",
		name = tr("Old Medal"),
		image = load("res://assets/images/amulets/amulet_42.png"),
		category = "Amulet",
		
		base_stats = {
			defense = [1, 2.5],
		},
		rarity = "WHITE",
	},
	
	lit_torch = {
		code = "lit torch",
		name = tr("Lit Torch"),
		image = load("res://assets/images/misc/torch_2.png"),
		category = "Accessory",
		
		base_stats = {
			rarity = [1, 2],
		},
		rarity = "WHITE",
	},
	
}
