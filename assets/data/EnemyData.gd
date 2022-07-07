extends Node

var enemies = {
	skeleton = {
		code = "sleleton",
		name = "SKELETON",
		stats = {
			"damage": 10, 
			"life": 1000,  
			"defense": 10,  
			"strength": 0,  
			"dexterity": 0,  
			"endurance": 0, 
			"dodge": 5, 
			"critical": 10,  
			"block": 5, 
#			"bonus_rarity": 0, 
		},
		
		frames = preload("res://assets/enemy_animation/skeleton_frames.tres"),
		sprite_properties = {
			idle = {
				scale = Vector2(7, 7),
#				position = Vector2(560, 344)
				position_offset = Vector2(0, 0)
			},
			hit = {
				scale = Vector2(7, 7),
#				position = Vector2(581, 344)
				position_offset = Vector2(21, 0)
			},
			attack = {
				scale = Vector2(7, 7),
#				position = Vector2(511, 323)
				position_offset = Vector2(-49, -21)
			}
		}
	}
}
