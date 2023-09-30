extends Node

var achievements = {
	green_1 = {
		name = "GREEN_1",
		description = "GREEN_1_DESCRIPTION",
		reqs = [{
			category = "progress",
			variable = "total_rarities",
			field = "GREEN",
			amount = 1
		}],
		rewards = [{
			type = "silver",
			amount = 100
		}]
	},
	
	blue_1 = {
		name = "BLUE_1",
		description = "BLUE_1_DESCRIPTION",
		reqs = [{
			category = "progress",
			variable = "total_rarities",
			field = "BLUE",
			amount = 1
		}],
		rewards = [{
			type = "silver",
			amount = 200
		}]
	},
	
	purple_1 = {
		name = "PURPLE_1",
		description = "PURPLE_1_DESCRIPTION",
		reqs = [{
			category = "progress",
			variable = "total_rarities",
			field = "PURPLE",
			amount = 1
		}],
		rewards = [{
			type = "silver",
			amount = 300
		}]
	},
	
	yellow_1 = {
		name = "YELLOW_1",
		description = "YELLOW_1_DESCRIPTION",
		reqs = [{
			category = "progress",
			variable = "total_rarities",
			field = "YELLOW",
			amount = 1
		}],
		rewards = [{
			type = "silver",
			amount = 1000
		}]
	},
	
	red_1 = {
		name = "RED_1",
		description = "RED_1_DESCRIPTION",
		reqs = [{
			category = "progress",
			variable = "total_rarities",
			field = "RED",
			amount = 1
		}],
		rewards = [{
			type = "silver",
			amount = 5000
		}]
	},
	
	chests_10 = {
		name = "CHESTS_10", # chests lover
		description = "CHESTS_10_DESCRIPTION", # open 100 chests
		reqs = [{
			category = "progress",
			variable = "total_chests",
			amount = 10
		}],
		rewards = [{
			type = "silver",
			amount = 10
		}]
	},
	
	chests_50 = {
		name = "CHESTS_50",
		description = "CHESTS_50_DESCRIPTION",
		reqs = [{
			category = "progress",
			variable = "total_chests",
			amount = 50
		}],
		rewards = [{
			type = "silver",
			amount = 50
		}]
	},
	
	chests_100 = {
		name = "CHESTS_100", 
		description = "CHESTS_100_DESCRIPTION",
		reqs = [{
			category = "progress",
			variable = "total_chests",
			amount = 100
		}],
		rewards = [{
			type = "silver",
			amount = 100
		}]
	},
	
	chests_500 = {
		name = "CHESTS_500",
		description = "CHESTS_500_DESCRIPTION", 
		reqs = [{
			category = "progress",
			variable = "total_chests",
			amount = 500
		}],
		rewards = [{
			type = "silver",
			amount = 500
		}]
	},
	
	chests_1000 = {
		name = "CHESTS_1000", 
		description = "CHESTS_1000_DESCRIPTION", 
		reqs = [{
			category = "progress",
			variable = "total_chests",
			amount = 1000
		}],
		rewards = [{
			type = "silver",
			amount = 1000
		}]
	},
	
	chests_10000 = {
		name = "CHESTS_10000", 
		description = "CHESTS_10000_DESCRIPTION", 
		reqs = [{
			category = "progress",
			variable = "total_chests",
			amount = 10000
		}],
		rewards = [{
			type = "silver",
			amount = 10000
		}]
	},
	
	equipment_white = {
		name = "EQUIPMENT_WHITE",
		description = "EQUIPMENT_WHITE_DESCRIPTION",
		reqs = [{
			category = "equipment",
			variable = "gear",
			amount = "all_or_higher",
			rarity = "WHITE"
		}],
		rewards = [{
			type = "silver",
			amount = 200
		}]
	},
	
	equipment_green = {
		name = "EQUIPMENT_GREEN",
		description = "EQUIPMENT_GREEN_DESCRIPTION",
		reqs = [{
			category = "equipment",
			variable = "gear",
			amount = "all_or_higher",
			rarity = "GREEN"
		}],
		rewards = [{
			type = "silver",
			amount = 500
		}]
	},
	
	equipment_blue = {
		name = "EQUIPMENT_BLUE",
		description = "EQUIPMENT_BLUE_DESCRIPTION",
		reqs = [{
			category = "equipment",
			variable = "gear",
			amount = "all_or_higher",
			rarity = "BLUE"
		}],
		rewards = [{
			type = "silver",
			amount = 1250
		}]
	},
	
	equipment_purple = {
		name = "EQUIPMENT_PURPLE",
		description = "EQUIPMENT_PURPLE_DESCRIPTION",
		reqs = [{
			category = "equipment",
			variable = "gear",
			amount = "all_or_higher",
			rarity = "PURPLE"
		}],
		rewards = [{
			type = "silver",
			amount = 2500
		}]
	},
	
	equipment_yellow = {
		name = "EQUIPMENT_YELLOW",
		description = "EQUIPMENT_YELLOW_DESCRIPTION",
		reqs = [{
			category = "equipment",
			variable = "gear",
			amount = "all_or_higher",
			rarity = "YELLOW"
		}],
		rewards = [{
			type = "silver",
			amount = 8500
		}]
	},
	
	equipment_red = {
		name = "EQUIPMENT_RED",
		description = "EQUIPMENT_RED_DESCRIPTION",
		reqs = [{
			category = "equipment",
			variable = "gear",
			amount = "all_or_higher",
			rarity = "RED"
		}],
		rewards = [{
			type = "silver",
			amount = 20000
		}]
	},
}
