extends Node

var enemies = {
	skeleton = {
		code = "sleleton",
		name = "SKELETON",
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
		
		frames = preload("res://assets/enemy_animation/skeleton_frames.tres"),
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
			}
		}
	},
	fire_worm = {
		code = "fire_worm",
		name = "FIRE_WORM",
		stats = {
			"damage": 20, 
			"life": 3000,  
			"defense": 200,
			"strength": 150,  
			"dexterity": 50,  
			"endurance": 100, 
			"dodge": 50, 
			"critical": 40,  
			"block": 5, 
#			"bonus_rarity": 0, 
		},
		
		frames = preload("res://assets/enemy_animation/fire_worm_frames.tres"),
		sprite_properties = {
			idle = {
				fight_scale = Vector2(5, 5),
				location_scale = Vector2(3, 3),
#				position = Vector2(560, 344)
				position_offset = Vector2(0, 0)
			},
			hit = {
				fight_scale = Vector2(5, 5),
				location_scale = Vector2(3, 3),
#				position = Vector2(581, 344)
				position_offset = Vector2(21, 0)
			},
			attack = {
				fight_scale = Vector2(5, 5),
				location_scale = Vector2(3, 3),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -21)
			}
		}
	}
}
