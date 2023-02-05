extends Node

var enemies = {
	skeleton = {
		code = "sleleton",
		name = "SKELETON",
		stats = {
			"damage": 8, 
			"life": 200,  
			"defense": 100, # 10% neg
			"strength": 0,  
			"dexterity": 0,  
			"endurance": 0, 
			"dodge": 5, 
			"critical": 5,  
			"block": 10, 
#			"bonus_rarity": 0, 
		},
		level = 1,
		
		frames = preload("res://assets/enemy_animation/skeleton_frames.tres"),
		shade = Color(1, 1, 1, 1),
		sprite_properties = {
			idle = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(560, 344)
				position_offset = Vector2(0, 0)
			},
			hit = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(581, 344)
				position_offset = Vector2(21, 0)
			},
			attack = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			},
			death = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			}
		}
	},
	nature_skeleton = {
		code = "nature_skeleton",
		name = "NATURE_SKELETON",
		stats = {
			"damage": 12, 
			"life": 280,  
			"defense": 120, # 10% neg
			"strength": 0,  
			"dexterity": 0,  
			"endurance": 0, 
			"dodge": 8, 
			"critical": 7,  
			"block": 10, 
#			"bonus_rarity": 0, 
		},
		level = 2,
		
		frames = preload("res://assets/enemy_animation/skeleton_frames.tres"),
		shade = Color(0.2, 0.466667, 0.078431, 1),
		sprite_properties = {
			idle = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(560, 344)
				position_offset = Vector2(0, 0)
			},
			hit = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(581, 344)
				position_offset = Vector2(21, 0)
			},
			attack = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			},
			death = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			}
		}
	},
	wood_skeleton = {
		code = "wood_skeleton",
		name = "WOOD_SKELETON",
		stats = {
			"damage": 18, 
			"life": 400,  
			"defense": 170, # 10% neg
			"strength": 0,  
			"dexterity": 0,  
			"endurance": 0, 
			"dodge": 7, 
			"critical": 10,  
			"block": 15, 
#			"bonus_rarity": 0, 
		},
		level = 4,
		
		frames = preload("res://assets/enemy_animation/skeleton_frames.tres"),
		shade = Color(0.505882, 0.317647, 0.078431, 1),
		sprite_properties = {
			idle = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(560, 344)
				position_offset = Vector2(0, 0)
			},
			hit = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(581, 344)
				position_offset = Vector2(21, 0)
			},
			attack = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			},
			death = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			}
		}
	},
	gray_skeleton = {
		code = "gray_skeleton",
		name = "GRAY_SKELETON",
		stats = {
			"damage": 33, 
			"life": 1000,  
			"defense": 100, # 10% neg
			"strength": 0,  
			"dexterity": 0,  
			"endurance": 0, 
			"dodge": 5, 
			"critical": 10,  
			"block": 15, 
#			"bonus_rarity": 0, 
		},
		level = 5,
		
		frames = preload("res://assets/enemy_animation/skeleton_frames.tres"),
		shade = Color(0.55, 0.55, 0.55, 1),
		sprite_properties = {
			idle = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(560, 344)
				position_offset = Vector2(0, 0)
			},
			hit = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(581, 344)
				position_offset = Vector2(21, 0)
			},
			attack = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			},
			death = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			}
		}
	},
	sand_skeleton = {
		code = "sand_skeleton",
		name = "SAND_SKELETON",
		stats = {
			"damage": 33, 
			"life": 1000,  
			"defense": 100, # 10% neg
			"strength": 0,  
			"dexterity": 0,  
			"endurance": 0, 
			"dodge": 5, 
			"critical": 10,  
			"block": 15, 
#			"bonus_rarity": 0, 
		},
		level = 7,
		
		frames = preload("res://assets/enemy_animation/skeleton_frames.tres"),
		shade = Color(1, 0.39, 0.04, 1),
		sprite_properties = {
			idle = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(560, 344)
				position_offset = Vector2(0, 0)
			},
			hit = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(581, 344)
				position_offset = Vector2(21, 0)
			},
			attack = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			},
			death = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			}
		}
	},
	spirit_skeleton = {
		code = "spirit_skeleton",
		name = "SPIRIT_SKELETON",
		stats = {
			"damage": 33, 
			"life": 1000,  
			"defense": 100, # 10% neg
			"strength": 0,  
			"dexterity": 0,  
			"endurance": 0, 
			"dodge": 5, 
			"critical": 10,  
			"block": 15, 
#			"bonus_rarity": 0, 
		},
		level = 7,
		
		frames = preload("res://assets/enemy_animation/skeleton_frames.tres"),
		shade = Color(1, 2, 1, 1),
		sprite_properties = {
			idle = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(560, 344)
				position_offset = Vector2(0, 0)
			},
			hit = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(581, 344)
				position_offset = Vector2(21, 0)
			},
			attack = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			},
			death = {
				fight_scale = Vector2(7, 7),
				location_scale = Vector2(5, 5),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -16)
			}
		}
	},
	
	
	
	
	
	
	
	
#	fire_worm = {
#		code = "fire_worm",
#		name = "FIRE_WORM",
#		stats = {
#			"damage": 20, 
#			"life": 3000,  
#			"defense": 200,
#			"strength": 150,  
#			"dexterity": 50,  
#			"endurance": 100, 
#			"dodge": 50, 
#			"critical": 40,  
#			"block": 5, 
##			"bonus_rarity": 0, 
#		},
#
#		frames = preload("res://assets/enemy_animation/fire_worm_frames.tres"),
#		sprite_properties = {
#			idle = {
#				fight_scale = Vector2(5, 5),
#				location_scale = Vector2(3, 3),
##				position = Vector2(560, 344)
#				position_offset = Vector2(0, 0)
#			},
#			hit = {
#				fight_scale = Vector2(5, 5),
#				location_scale = Vector2(3, 3),
##				position = Vector2(581, 344)
#				position_offset = Vector2(21, 0)
#			},
#			attack = {
#				fight_scale = Vector2(5, 5),
#				location_scale = Vector2(3, 3),
##				position = Vector2(511, 323)
#				position_offset = Vector2(-49, -21)
#			}
#		}
#	}
}
