extends Node

var ITEM_LEVEL = {
	"WHITE": 1,
	"GREEN": 2,
	"BLUE": 3,
}

var weapons = {
	# WHITE CATEGORY
	simple_axe = {
		code = "simple_axe",
		name = "SIMPLE_AXE",
		texture = load("res://assets/images/axes/simple_axe.png"),
		category = "one_handed",
		
		base_stats = {
			damage = [2.5, 5],
		},
		rarity = "WHITE",
	},
	
	wooden_sword = {
		code = "wooden_sword",
		name = "WOODEN_SWORD",
		texture = load("res://assets/images/swords/wooden_sword.png"),
		category = "one_handed",
		
		base_stats = {
			damage = [1, 7],
		},
		rarity = "WHITE",
	},
	
	copper_dagger = {
		code = "copper_dagger",
		name = "COPPER_DAGGER",
		texture = load("res://assets/images/swords/copper_dagger.png"),
		category = "one_handed",
		
		base_stats = {
			damage = [2, 4],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	iron_sword = {
		code = "iron_sword",
		name = "IRON_SWORD",
		texture = load("res://assets/images/swords/iron_sword.png"),
		category = "two_handed",
		
		base_stats = {
			damage = [6, 12],
		},
		rarity = "GREEN",
	},
	
	meteor_sword = {
		code = "meteor_sword",
		name = "METEOR_SWORD",
		texture = load("res://assets/images/swords/meteor_sword.png"),
		category = "two_handed",
		
		base_stats = {
			damage = [12, 18],
		},
		rarity = "BLUE",
	},
}

var armour = {
	# WHITE CATEGORY
	leather_chestplate = {
		code = "leather_chestplate",
		name = "LEATHER_CHESTPLATE",
		texture = load("res://assets/images/armors/leather_chestplate.png"),
		category = "body_armour",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "WHITE",
	},
	
	leather_hood = {
		code = "leather_hood",
		name = "LEATHER_HOOD",
		texture = load("res://assets/images/helmets/leather_hood.png"),
		category = "helmet",
		
		base_stats = {
			defense = [3, 5], 
		},
		rarity = "WHITE",
	},
	
	leather_gloves = {
		code = "leather_gloves",
		name = "LEATHER_GLOVES",
		texture = load("res://assets/images/gloves/leather_gloves.png"),
		category = "gloves",
		
		base_stats = {
			defense = [0.5, 1.5], 
		},
		rarity = "WHITE",
	},
	
	leather_boots = {
		code = "leather_boots",
		name = "LEATHER_BOOTS",
		texture = load("res://assets/images/shoes/leather_boots.png"),
		category = "boots",
		
		base_stats = {
			defense = [1, 3], 
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	copper_chestplate = {
		code = "copper_chestplate",
		name = "COPPER_CHESTPLATE",
		texture = load("res://assets/images/armors/copper_chestplate.png"),
		category = "body_armour",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
	
	copper_helmet = {
		code = "copper_helmet",
		name = "COPPER_HELMET",
		texture = load("res://assets/images/helmets/copper_helmet.png"),
		category = "helmet",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
	
	copper_gloves = {
		code = "copper_gloves",
		name = "COPPER_GLOVES",
		texture = load("res://assets/images/gloves/copper_gloves.png"),
		category = "gloves",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
	
	copper_boots = {
		code = "copper_boots",
		name = "COPPER_BOOTS",
		texture = load("res://assets/images/shoes/copper_boots.png"),
		category = "boots",
		
		base_stats = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
	
	# BLUE CATEGORY
	ice_gloves = {
		code = "ice_gloves",
		name = "ICE_GLOVES",
		texture = load("res://assets/images/gloves/ice_gloves.png"),
		category = "gloves",
		
		base_stats = {
			defense = [6.5, 9.5],
		},
		rarity = "BLUE",
	},
	
	ice_boots = {
		code = "ice_boots",
		name = "ICE_BOOTS",
		texture = load("res://assets/images/shoes/ice_boots.png"),
		category = "boots",
		
		base_stats = {
			defense = [7, 10],
		},
		rarity = "BLUE",
	},
	
	ice_helmet = {
		code = "ice_helmet",
		name = "ICE_HELMET",
		texture = load("res://assets/images/helmets/ice_helmet.png"),
		category = "helmet",
		
		base_stats = {
			defense = [8, 12],
		},
		rarity = "BLUE",
	},
	
	ice_chestplate = {
		code = "ice_chestplate",
		name = "ICE_CHESTPLATE",
		texture = load("res://assets/images/armors/ice_chestplate.png"),
		category = "body_armour",
		
		base_stats = {
			defense = [12, 18],
		},
		rarity = "BLUE",
	},
}

var jewelery = {
	# WHITE CATEGORY
	copper_ring = {
		code = "copper_ring",
		name = "COPPER_RING",
		texture = load("res://assets/images/rings/copper_ring.png"),
		category = "ring",
		
		base_stats = {
			damage = 3,
		},
		rarity = "WHITE",
	},
	
	old_medal = {
		code = "old_medal",
		name = "OLD_MEDAL",
		texture = load("res://assets/images/amulets/old_medal.png"),
		category = "amulet",
		
		base_stats = {
			defense = [1, 2.5],
		},
		rarity = "WHITE",
	},
	
	lit_torch = {
		code = "lit_torch",
		name = "LIT_TORCH",
		texture = load("res://assets/images/misc/lit_torch.png"),
		category = "accessory",
		
		base_stats = {
			rarity = [1, 2],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	silver_ring = {
		code = "silver_ring",
		name = "SILVER_RING",
		texture = load("res://assets/images/rings/silver_ring.png"),
		category = "ring",
		
		base_stats = {
			damage = [5, 7],
		},
		rarity = "GREEN",
	},
	
	gold_ring = {
		code = "gold_ring",
		name = "GOLD_RING",
		texture = load("res://assets/images/rings/gold_ring.png"),
		category = "ring",
		
		base_stats = {
			damage = [5, 7],
		},
		rarity = "GREEN",
	},
	
	silver_skull_amulet1 = {
		code = "silver_skull_amulet1",
		name = "SKULL_AMULET_1",
		texture = load("res://assets/images/amulets/silver_skull_amulet1.png"),
		category = "amulet",
		
		base_stats = {
			defense = [1.5, 3.5],
		},
		rarity = "GREEN",
	},
	
	
	# BLUE CATEGORY
	sacred_scarab = {
		code = "sacred_scarab",
		name = "SACRED_SCARAB",
		texture = load("res://assets/images/accessory/sacred_scarab.png"),
		category = "accessory",
		
		base_stats = {
			rarity = [5, 5],
		},
		rarity = "BLUE",
	},
	
	ice_pearl = {
		code = "ice_pearl",
		name = "ICY_PEARL",
		texture = load("res://assets/images/amulets/ice_pearl.png"),
		category = "amulet",
		
		base_stats = {
			defense = [2, 4.5],
		},
		rarity = "BLUE",
	},
}

func _init():
	pass
