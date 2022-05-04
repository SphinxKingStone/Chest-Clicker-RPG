extends Node

var enemies = {
	skeleton = {
		code = "sleleton",
		name = "SKELETON",
		stats = {},
		
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
