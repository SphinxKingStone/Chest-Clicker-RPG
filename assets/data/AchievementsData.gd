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
	chests_100 = {
		name = "CHESTS_100", # chests lover
		description = "CHESTS_100_DESCRIPTION", # open 100 chests
		reqs = [{
			category = "progress",
			variable = "total_chests",
			amount = 100
		}],
		rewards = [{
			type = "silver",
			amount = 350
		}]
	}
}
