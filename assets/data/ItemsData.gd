extends Node

const ITEM_LEVEL = {
	"WHITE": 1,
	"GREEN": 2,
	"BLUE": 3,
	"PURPLE": 4,
}

const ITEM_CATEGORY = [
	"two_handed",
	"one_handed",
	"shield",
	"body_armour",
	"helmet",
	"gloves",
	"boots",
	"ring",
	"amulet",
	"accessory",
]

var one_handed = {
	# WHITE CATEGORY
	simple_axe = {
		code = "simple_axe",
		name = "SIMPLE_AXE",
		texture = load("res://assets/images/axes/simple_axe.png"),
		category = "one_handed",
		
		base_stats_data = {
			damage = [2.5, 5],
		},
		rarity = "WHITE",
	},
	
	wooden_sword = {
		code = "wooden_sword",
		name = "WOODEN_SWORD",
		texture = load("res://assets/images/swords/wooden_sword.png"),
		category = "one_handed",
		
		base_stats_data = {
			damage = [1, 7],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	copper_dagger = {
		code = "copper_dagger",
		name = "COPPER_DAGGER",
		texture = load("res://assets/images/swords/copper_dagger.png"),
		category = "one_handed",
		
		base_stats_data = {
			damage = [5, 8],
		},
		rarity = "GREEN",
	},
	
	# BLUE CATEGORY
	iron_rapier = {
		code = "iron_rapier",
		name = "IRON_RAPIER",
		texture = load("res://assets/images/swords/iron_rapier.png"),
		category = "one_handed",
		
		base_stats_data = {
			damage = [7, 10],
		},
		rarity = "BLUE",
	},
	
	# PURPLE CATEGORY
	astral_axe = {
		code = "astral_axe",
		name = "ASTRAL_AXE",
		texture = load("res://assets/images/axes/astral_axe.png"),
		category = "one_handed",
		
		base_stats_data = {
			damage = [11, 16],
		},
		rarity = "PURPLE",
	},
}

var shield = {
	# WHITE CATEGORY
	mahogany_shield = {
		code = "mahogany_shield",
		name = "MAHOGANY_SHIELD",
		texture = load("res://assets/images/shields/mahogany_shield.png"),
		category = "shield",
		
		base_stats_data = {
			defense = [4, 6],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	copper_shield = {
		code = "copper_shield",
		name = "COPPER_SHIELD",
		texture = load("res://assets/images/shields/copper_shield.png"),
		category = "shield",
		
		base_stats_data = {
			defense = [6, 9],
		},
		rarity = "GREEN",
	},
	
	# BLUE CATEGORY
	light_silver_shield = {
		code = "light_silver_shield",
		name = "LIGHT_SILVER_SHIELD",
		texture = load("res://assets/images/shields/light_silver_shield.png"),
		category = "shield",
		
		base_stats_data = {
			defense = [9, 14],
		},
		rarity = "BLUE",
	},
	
	# PURPLE CATEGORY
	astral_shield = {
		code = "astral_shield",
		name = "ASTRAL_SHIELD",
		texture = load("res://assets/images/shields/astral_shield.png"),
		category = "shield",
		
		base_stats_data = {
			defense = [8, 14],
		},
		rarity = "PURPLE",
	},
}

var two_handed = {
	# GREEN CATEGORY
	iron_sword = {
		code = "iron_sword",
		name = "IRON_SWORD",
		texture = load("res://assets/images/swords/iron_sword.png"),
		category = "two_handed",
		
		base_stats_data = {
			damage = [6, 12],
		},
		rarity = "GREEN",
	},
	
	# BLUE CATEGORY
	meteor_sword = {
		code = "meteor_sword",
		name = "METEOR_SWORD",
		texture = load("res://assets/images/swords/meteor_sword.png"),
		category = "two_handed",
		
		base_stats_data = {
			damage = [12, 18],
		},
		rarity = "BLUE",
	},
	
	# PURPLE CATEGORY
	astral_battle_axe = {
		code = "astral_battle_axe",
		name = "ASTRAL_BATTLE_AXE",
		texture = load("res://assets/images/axes/astral_battle_axe.png"),
		category = "two_handed",
		
		base_stats_data = {
			damage = [19, 27],
		},
		rarity = "PURPLE",
	},
}

var body_armour = {
	# WHITE CATEGORY
	leather_chestplate = {
		code = "leather_chestplate",
		name = "LEATHER_CHESTPLATE",
		texture = load("res://assets/images/armors/leather_chestplate.png"),
		category = "body_armour",
		
		base_stats_data = {
			defense = [4, 6],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	copper_chestplate = {
		code = "copper_chestplate",
		name = "COPPER_CHESTPLATE",
		texture = load("res://assets/images/armors/copper_chestplate.png"),
		category = "body_armour",
		
		base_stats_data = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
	
	# BLUE CATEGORY
	ice_chestplate = {
		code = "ice_chestplate",
		name = "ICE_CHESTPLATE",
		texture = load("res://assets/images/armors/ice_chestplate.png"),
		category = "body_armour",
		
		base_stats_data = {
			defense = [12, 18],
		},
		rarity = "BLUE",
	},
	
	# PURPLE CATEGORY
	brass_dome = {
		code = "brass_dome",
		name = "BRASS_DOME",
		texture = load("res://assets/images/armors/brass_dome.png"),
		category = "body_armour",
		
		base_stats_data = {
			defense = [19, 22],
		},
		rarity = "PURPLE",
	},
}

var helmet = {
	# WHITE CATEGORY
	leather_hood = {
		code = "leather_hood",
		name = "LEATHER_HOOD",
		texture = load("res://assets/images/helmets/leather_hood.png"),
		category = "helmet",
		
		base_stats_data = {
			defense = [3, 5], 
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	copper_helmet = {
		code = "copper_helmet",
		name = "COPPER_HELMET",
		texture = load("res://assets/images/helmets/copper_helmet.png"),
		category = "helmet",
		
		base_stats_data = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
	
	# BLUE CATEGORY
	ice_helmet = {
		code = "ice_helmet",
		name = "ICE_HELMET",
		texture = load("res://assets/images/helmets/ice_helmet.png"),
		category = "helmet",
		
		base_stats_data = {
			defense = [8, 12],
		},
		rarity = "BLUE",
	},
	
	# PURPLE CATEGORY
	brass_helmet = {
		code = "brass_helmet",
		name = "BRASS_HELMET",
		texture = load("res://assets/images/helmets/brass_helmet.png"),
		category = "helmet",
		
		base_stats_data = {
			defense = [13, 15],
		},
		rarity = "PURPLE",
	},
}

var gloves = {
	# WHITE CATEGORY
	leather_gloves = {
		code = "leather_gloves",
		name = "LEATHER_GLOVES",
		texture = load("res://assets/images/gloves/leather_gloves.png"),
		category = "gloves",
		
		base_stats_data = {
			defense = [0.5, 1.5], 
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	copper_gloves = {
		code = "copper_gloves",
		name = "COPPER_GLOVES",
		texture = load("res://assets/images/gloves/copper_gloves.png"),
		category = "gloves",
		
		base_stats_data = {
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
		
		base_stats_data = {
			defense = [6.5, 9.5],
		},
		rarity = "BLUE",
	},
	
	# PURPLE CATEGORY
	deadly_gloves = {
		code = "deadly_gloves",
		name = "DEADLY_GLOVES",
		texture = load("res://assets/images/gloves/deadly_gloves.png"),
		category = "gloves",
		
		base_stats_data = {
			defense = [10, 14],
		},
		rarity = "PURPLE",
	},
	
}

var boots = {
	# WHITE CATEGORY
	leather_boots = {
		code = "leather_boots",
		name = "LEATHER_BOOTS",
		texture = load("res://assets/images/boots/leather_boots.png"),
		category = "boots",
		
		base_stats_data = {
			defense = [1, 3], 
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	copper_boots = {
		code = "copper_boots",
		name = "COPPER_BOOTS",
		texture = load("res://assets/images/boots/copper_boots.png"),
		category = "boots",
		
		base_stats_data = {
			defense = [4, 6],
		},
		rarity = "GREEN",
	},
	
	# BLUE CATEGORY
	ice_boots = {
		code = "ice_boots",
		name = "ICE_BOOTS",
		texture = load("res://assets/images/boots/ice_boots.png"),
		category = "boots",
		
		base_stats_data = {
			defense = [7, 10],
		},
		rarity = "BLUE",
	},
	
	# PURPLE CATEGORY
	brass_boots = {
		code = "brass_boots",
		name = "BRASS_BOOTS",
		texture = load("res://assets/images/boots/brass_boots.png"),
		category = "boots",

		base_stats_data = {
			defense = [11, 15],
		},
		rarity = "PURPLE",
	},
}

var ring = {
	# WHITE CATEGORY
	copper_ring = {
		code = "copper_ring",
		name = "COPPER_RING",
		texture = load("res://assets/images/rings/copper_ring.png"),
		category = "ring",
		
		base_stats_data = {
			damage = [3, 3],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	silver_ring = {
		code = "silver_ring",
		name = "SILVER_RING",
		texture = load("res://assets/images/rings/silver_ring.png"),
		category = "ring",
		
		base_stats_data = {
			damage = [5, 7],
		},
		rarity = "GREEN",
	},
	
	gold_ring = {
		code = "gold_ring",
		name = "GOLD_RING",
		texture = load("res://assets/images/rings/gold_ring.png"),
		category = "ring",
		
		base_stats_data = {
			damage = [5, 7],
		},
		rarity = "GREEN",
	},
	
	# BLUE CATEGORY
	icy_ring = {
		code = "icy_ring",
		name = "ICY_RING",
		texture = load("res://assets/images/rings/icy_ring.png"),
		category = "ring",
		
		base_stats_data = {
			damage = [8, 10],
		},
		rarity = "BLUE",
	},
	
	meteor_ring = {
		code = "meteor_ring",
		name = "METEOR_RING",
		texture = load("res://assets/images/rings/meteor_ring.png"),
		category = "ring",
		
		base_stats_data = {
			damage = [8, 10],
		},
		rarity = "BLUE",
	},
	
	# PURPLE CATEGORY
	amber_ring = {
		code = "amber_ring",
		name = "AMBER_RING",
		texture = load("res://assets/images/rings/amber_ring.png"),
		category = "ring",

		base_stats_data = {
			defense = [11, 14],
		},
		rarity = "PURPLE",
	},
}

var amulet = {
	# WHITE CATEGORY
	old_medal = {
		code = "old_medal",
		name = "OLD_MEDAL",
		texture = load("res://assets/images/amulets/old_medal.png"),
		category = "amulet",
		
		base_stats_data = {
			defense = [1, 2.5],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	silver_skull_amulet1 = {
		code = "silver_skull_amulet1",
		name = "SKULL_AMULET_1",
		texture = load("res://assets/images/amulets/silver_skull_amulet1.png"),
		category = "amulet",
		
		base_stats_data = {
			defense = [1.5, 3.5],
		},
		rarity = "GREEN",
	},
	
	# BLUE CATEGORY
	ice_pearl = {
		code = "ice_pearl",
		name = "ICY_PEARL",
		texture = load("res://assets/images/amulets/ice_pearl.png"),
		category = "amulet",
		
		base_stats_data = {
			defense = [2, 4.5],
		},
		rarity = "BLUE",
	},
	
	# PURPLE CATEGORY
	amber_amulet = {
		code = "amber_amulet",
		name = "AMBER_AMULET",
		texture = load("res://assets/images/amulets/amber_amulet.png"),
		category = "amulet",

		base_stats_data = {
			defense = [5, 7],
		},
		rarity = "PURPLE",
	},
}

var accessory = {
	# WHITE CATEGORY
	lit_torch = {
		code = "lit_torch",
		name = "LIT_TORCH",
		texture = load("res://assets/images/accessory/lit_torch.png"),
		category = "accessory",
		
		base_stats_data = {
			bonus_rarity = [1, 2],
		},
		rarity = "WHITE",
	},
	
	# GREEN CATEGORY
	skull = {
		code = "skull",
		name = "SKULL",
		texture = load("res://assets/images/accessory/skull.png"),
		category = "accessory",
		
		base_stats_data = {
			bonus_rarity = [3, 4],
		},
		rarity = "GREEN",
	},
	
	# BLUE CATEGORY
	sacred_scarab = {
		code = "sacred_scarab",
		name = "SACRED_SCARAB",
		texture = load("res://assets/images/accessory/sacred_scarab.png"),
		category = "accessory",
		
		base_stats_data = {
			bonus_rarity = [5, 5],
		},
		rarity = "BLUE",
	},
	
	# PURPLE CATEGORY
	golden_tooth = {
		code = "golden_tooth",
		name = "GOLDEN_TOOTH",
		texture = load("res://assets/images/accessory/golden_tooth.png"),
		category = "accessory",

		base_stats_data = {
			bonus_rarity = [6, 7],
		},
		rarity = "PURPLE",
	},
}

func _init():
	pass
