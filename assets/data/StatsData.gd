extends Node

var stats_names = ["damage", "life", "defense", "strength", "dexterity", "endurance", "dodge", "critical", "block", "bonus_rarity"]

var reference_stats = {
	damage = {
		1: {min = 4, max = 10},
		2: {min = 11, max = 20},
		3: {min = 21, max = 30},
		4: {min = 31, max = 40},
		5: {min = 41, max = 55},
		6: {min = 56, max = 70},
		7: {min = 71, max = 100},
		8: {min = 101, max = 130},
	}, 
	life = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	defense = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dodge = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	critical = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	block = {
		1: {min = 1, max = 5},
		2: {min = 6, max = 10},
		3: {min = 11, max = 15},
		4: {min = 16, max = 20},
		5: {min = 21, max = 25},
		6: {min = 26, max = 30},
		7: {min = 31, max = 38},
		8: {min = 39, max = 46},
	}, 
	bonus_rarity = {
		1: {min = 1, max = 2},
		2: {min = 3, max = 4},
		3: {min = 5, max = 6},
		4: {min = 7, max = 8},
		5: {min = 9, max = 10},
		6: {min = 11, max = 12},
		7: {min = 13, max = 14},
		8: {min = 15, max = 16},
	}, 
}

var helmet_stats = {
	life = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	defense = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dodge = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	critical = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	block = {
		1: {min = 1, max = 5},
		2: {min = 6, max = 10},
		3: {min = 11, max = 15},
		4: {min = 16, max = 20},
		5: {min = 21, max = 25},
		6: {min = 26, max = 30},
		7: {min = 31, max = 38},
		8: {min = 39, max = 46},
	}, 
	bonus_rarity = {
		1: {min = 1, max = 2},
		2: {min = 3, max = 4},
		3: {min = 5, max = 6},
		4: {min = 7, max = 8},
		5: {min = 9, max = 10},
		6: {min = 11, max = 12},
		7: {min = 13, max = 14},
		8: {min = 15, max = 16},
	}, 
}

var one_handed_stats = {
	damage = {
		1: {min = 4, max = 10},
		2: {min = 11, max = 20},
		3: {min = 21, max = 30},
		4: {min = 31, max = 40},
		5: {min = 41, max = 55},
		6: {min = 56, max = 70},
		7: {min = 71, max = 100},
		8: {min = 101, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dodge = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	critical = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	block = {
		1: {min = 1, max = 5},
		2: {min = 6, max = 10},
		3: {min = 11, max = 15},
		4: {min = 16, max = 20},
		5: {min = 21, max = 25},
		6: {min = 26, max = 30},
		7: {min = 31, max = 38},
		8: {min = 39, max = 46},
	}, 
}

var two_handed_stats = {
	damage = {
		1: {min = 4, max = 10},
		2: {min = 11, max = 20},
		3: {min = 21, max = 30},
		4: {min = 31, max = 40},
		5: {min = 41, max = 55},
		6: {min = 56, max = 70},
		7: {min = 71, max = 100},
		8: {min = 101, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dodge = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	critical = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	block = {
		1: {min = 1, max = 5},
		2: {min = 6, max = 10},
		3: {min = 11, max = 15},
		4: {min = 16, max = 20},
		5: {min = 21, max = 25},
		6: {min = 26, max = 30},
		7: {min = 31, max = 38},
		8: {min = 39, max = 46},
	}, 
}

var shield_stats = {
	damage = {
		1: {min = 4, max = 10},
		2: {min = 11, max = 20},
		3: {min = 21, max = 30},
		4: {min = 31, max = 40},
		5: {min = 41, max = 55},
		6: {min = 56, max = 70},
		7: {min = 71, max = 100},
		8: {min = 101, max = 130},
	}, 
	life = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	defense = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dodge = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	critical = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	block = {
		1: {min = 1, max = 5},
		2: {min = 6, max = 10},
		3: {min = 11, max = 15},
		4: {min = 16, max = 20},
		5: {min = 21, max = 25},
		6: {min = 26, max = 30},
		7: {min = 31, max = 38},
		8: {min = 39, max = 46},
	}, 
	bonus_rarity = {
		1: {min = 1, max = 2},
		2: {min = 3, max = 4},
		3: {min = 5, max = 6},
		4: {min = 7, max = 8},
		5: {min = 9, max = 10},
		6: {min = 11, max = 12},
		7: {min = 13, max = 14},
		8: {min = 15, max = 16},
	}, 
}

var body_armour_stats = {
	life = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	defense = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dodge = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	},  
	block = {
		1: {min = 1, max = 5},
		2: {min = 6, max = 10},
		3: {min = 11, max = 15},
		4: {min = 16, max = 20},
		5: {min = 21, max = 25},
		6: {min = 26, max = 30},
		7: {min = 31, max = 38},
		8: {min = 39, max = 46},
	}, 
}

var gloves_stats = {
	damage = {
		1: {min = 4, max = 10},
		2: {min = 11, max = 20},
		3: {min = 21, max = 30},
		4: {min = 31, max = 40},
		5: {min = 41, max = 55},
		6: {min = 56, max = 70},
		7: {min = 71, max = 100},
		8: {min = 101, max = 130},
	}, 
	life = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	defense = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dodge = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	critical = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	block = {
		1: {min = 1, max = 5},
		2: {min = 6, max = 10},
		3: {min = 11, max = 15},
		4: {min = 16, max = 20},
		5: {min = 21, max = 25},
		6: {min = 26, max = 30},
		7: {min = 31, max = 38},
		8: {min = 39, max = 46},
	}, 
	bonus_rarity = {
		1: {min = 1, max = 2},
		2: {min = 3, max = 4},
		3: {min = 5, max = 6},
		4: {min = 7, max = 8},
		5: {min = 9, max = 10},
		6: {min = 11, max = 12},
		7: {min = 13, max = 14},
		8: {min = 15, max = 16},
	}, 
}

var boots_stats = {
	life = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	defense = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dodge = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
}

var ring_stats = {
	damage = {
		1: {min = 4, max = 10},
		2: {min = 11, max = 20},
		3: {min = 21, max = 30},
		4: {min = 31, max = 40},
		5: {min = 41, max = 55},
		6: {min = 56, max = 70},
		7: {min = 71, max = 100},
		8: {min = 101, max = 130},
	}, 
	life = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	bonus_rarity = {
		1: {min = 1, max = 2},
		2: {min = 3, max = 4},
		3: {min = 5, max = 6},
		4: {min = 7, max = 8},
		5: {min = 9, max = 10},
		6: {min = 11, max = 12},
		7: {min = 13, max = 14},
		8: {min = 15, max = 16},
	}, 
}

var amulet_stats = {
	damage = {
		1: {min = 4, max = 10},
		2: {min = 11, max = 20},
		3: {min = 21, max = 30},
		4: {min = 31, max = 40},
		5: {min = 41, max = 55},
		6: {min = 56, max = 70},
		7: {min = 71, max = 100},
		8: {min = 101, max = 130},
	}, 
	life = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	defense = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	bonus_rarity = {
		1: {min = 1, max = 2},
		2: {min = 3, max = 4},
		3: {min = 5, max = 6},
		4: {min = 7, max = 8},
		5: {min = 9, max = 10},
		6: {min = 11, max = 12},
		7: {min = 13, max = 14},
		8: {min = 15, max = 16},
	}, 
}

var accessory_stats = {
	damage = {
		1: {min = 4, max = 10},
		2: {min = 11, max = 20},
		3: {min = 21, max = 30},
		4: {min = 31, max = 40},
		5: {min = 41, max = 55},
		6: {min = 56, max = 70},
		7: {min = 71, max = 100},
		8: {min = 101, max = 130},
	}, 
	life = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	defense = {
		1: {min = 2, max = 12},
		2: {min = 13, max = 26},
		3: {min = 27, max = 40},
		4: {min = 41, max = 56},
		5: {min = 57, max = 70},
		6: {min = 71, max = 84},
		7: {min = 85, max = 105},
		8: {min = 106, max = 130},
	}, 
	strength = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dexterity = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	endurance = {
		1: {min = 1, max = 8},
		2: {min = 9, max = 16},
		3: {min = 17, max = 24},
		4: {min = 25, max = 32},
		5: {min = 33, max = 40},
		6: {min = 41, max = 48},
		7: {min = 49, max = 64},
		8: {min = 65, max = 88},
	}, 
	dodge = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	critical = {
		1: {min = 1, max = 3},
		2: {min = 4, max = 6},
		3: {min = 7, max = 9},
		4: {min = 10, max = 12},
		5: {min = 13, max = 15},
		6: {min = 16, max = 18},
		7: {min = 19, max = 24},
		8: {min = 25, max = 30},
	}, 
	block = {
		1: {min = 1, max = 5},
		2: {min = 6, max = 10},
		3: {min = 11, max = 15},
		4: {min = 16, max = 20},
		5: {min = 21, max = 25},
		6: {min = 26, max = 30},
		7: {min = 31, max = 38},
		8: {min = 39, max = 46},
	}, 
	bonus_rarity = {
		1: {min = 1, max = 2},
		2: {min = 3, max = 4},
		3: {min = 5, max = 6},
		4: {min = 7, max = 8},
		5: {min = 9, max = 10},
		6: {min = 11, max = 12},
		7: {min = 13, max = 14},
		8: {min = 15, max = 16},
	}, 
}

func _ready():
	pass
