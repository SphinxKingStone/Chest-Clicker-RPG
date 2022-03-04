extends Node


func _init():
	pass

var weapons = {
	# WHITE CATEGORY
	simple_axe = {
		code = "simple_axe",
		name = tr("Simple Axe"),
		texture = load("res://assets/images/axes/axe_7.png"),
		category = "one_handed",
		
		base_stats = {
			attack = [2.5, 5],
		},
		rarity = "WHITE",
	},
	
	wooden_sword = {
		code = "wooden_sword",
		name = tr("Wooden Sword"),
		texture = load("res://assets/images/swords/sword_6.png"),
		category = "one_handed",
		
		base_stats = {
			attack = [1, 7],
		},
		rarity = "WHITE",
	},
	
	copper_dagger = {
		code = "copper_dagger",
		name = tr("Copper Dagger"),
		texture = load("res://assets/images/swords/sword_86.png"),
		category = "one_handed",
		
		base_stats = {
			attack = [2, 4],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	iron_sword = {
		code = "iron_sword",
		name = tr("Iron Sword"),
		texture = load("res://assets/images/swords/sword_55.png"),
		category = "two_handed",
		
		base_stats = {
			attack = [6, 12],
		},
		rarity = "GREEN",
	},
	
	meteor_sword = {
		code = "meteor_sword",
		name = tr("Meteor Sword"),
		texture = load("res://assets/images/swords/sword_60.png"),
		category = "two_handed",
		
		base_stats = {
			attack = [12, 18],
		},
		rarity = "BLUE",
	},
}

var armour = {
	# WHITE CATEGORY
	leather_chestplate = {
		code = "leather_chestplate",
		name = tr("Leather Chestplate"),
		texture = load("res://assets/images/armors/armor_19.png"),
		category = "body_armour",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "WHITE",
	},
	
	leather_hood = {
		code = "leather_hood",
		name = tr("Leather Hood"),
		texture = load("res://assets/images/helmets/helmet_83.png"),
		category = "helmet",
		
		base_stats = {
			defense = [3, 5], 
		},
		rarity = "WHITE",
	},
	
	leather_gloves = {
		code = "leather_gloves",
		name = tr("Leather gloves"),
		texture = load("res://assets/images/gloves/glove_1.png"),
		category = "gloves",
		
		base_stats = {
			defense = [0.5, 1.5], 
		},
		rarity = "WHITE",
	},
	
	leather_boots = {
		code = "leather_boots",
		name = tr("Leather boots"),
		texture = load("res://assets/images/shoes/shoe_15.png"),
		category = "boots",
		
		base_stats = {
			defense = [1, 3], 
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	copper_chestplate = {
		code = "copper_chestplate",
		name = tr("Copper Chestplate"),
		texture = load("res://assets/images/armors/armor_17.png"),
		category = "body_armour",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
	
	copper_helmet = {
		code = "copper_helmet",
		name = tr("Copper Helmet"),
		texture = load("res://assets/images/helmets/helmet_78.png"),
		category = "helmet",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
	
	copper_gloves = {
		code = "copper_gloves",
		name = tr("Copper Gloves"),
		texture = load("res://assets/images/gloves/glove_4.png"),
		category = "gloves",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
	
	copper_boots = {
		code = "copper_boots",
		name = tr("Copper Boots"),
		texture = load("res://assets/images/shoes/shoe_13.png"),
		category = "boots",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
}

var jewelery = {
	# WHITE CATEGORY
	gold_ring = {
		code = "gold_ring",
		name = tr("Gold Ring"),
		texture = load("res://assets/images/rings/ring_16.png"),
		category = "ring",
		
		base_stats = {
			attack = 5,
		},
		rarity = "WHITE",
	},
	
	old_medal = {
		code = "old_medal",
		name = tr("Old Medal"),
		texture = load("res://assets/images/amulets/amulet_42.png"),
		category = "amulet",
		
		base_stats = {
			defense = [1, 2.5],
		},
		rarity = "WHITE",
	},
	
	lit_torch = {
		code = "lit_torch",
		name = tr("Lit Torch"),
		texture = load("res://assets/images/misc/torch_2.png"),
		category = "accessory",
		
		base_stats = {
			rarity = [1, 2],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	silver_ring = {
		code = "silver_ring",
		name = tr("Silver Ring"),
		texture = load("res://assets/images/rings/ring_5.png"),
		category = "ring",
		
		base_stats = {
			attack = 7,
		},
		rarity = "GREEN",
	},
	
	silver_skull_amulet1 = {
		code = "silver_skull_amulet1",
		name = tr("Cheap Skull Amulet"),
		texture = load("res://assets/images/amulets/amulet_21.png"),
		category = "amulet",
		
		base_stats = {
			defense = [1.5, 3.5],
		},
		rarity = "GREEN",
	},
}
