extends Node

var stats_names = ["damage", "health", "defense", "strength", "dexterity", "endurance", "dodge", "critical", "block", "bonus_rarity"]

var stats_values = {
	damage = {
		1: {min = 4, max = 10},
		2: {min = 11, max = 20},
		3: {min = 21, max = 30},
		4: {min = 31, max = 40},
	}, 
	health = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
	}, 
	defense = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
	}, 
	dodge = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
	}, 
	critical = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
	}, 
	block = {
		1: {min = 1, max = 5},
		2: {min = 6, max = 10},
		3: {min = 11, max = 15},
		4: {min = 16, max = 20},
	}, 
	bonus_rarity = {
		1: {min = 1, max = 2},
		2: {min = 3, max = 4},
		3: {min = 5, max = 6},
		4: {min = 7, max = 8},
	}, 
}

func _ready():
	pass 
