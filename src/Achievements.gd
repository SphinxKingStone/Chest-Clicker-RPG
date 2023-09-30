extends Node

var completed_achievements = []

signal new_achievement

func _ready():
	check_achievements()

func check_achievements():
	for ach in AchievementsData.achievements.values():
#		if ach in completed_achievements:
#			continue
		var skip = false
		for comp_ach in completed_achievements:
			if comp_ach.name == ach.name:
				skip = true
		if skip:
			continue
	
		var ach_good = true
		for req in ach.reqs:
			if req.category == "progress":
				if !check_req_progress(req):
					ach_good = false  
					break
			elif req.category == "equipment":
				if !check_req_equipment(req):
					ach_good = false  
					break
		if ach_good:
			completed_achievements.push_back(ach)
			emit_signal("new_achievement", ach)

func check_req_progress(req):
	if req.has("field"):
		return Progress[req.variable][req.field] >= req.amount
	return Progress[req.variable] >= req.amount

func check_req_equipment(req): # TODO doesn't work with 2 handed weapons
	if req.has("amount"):
		if req.amount == "all_or_higher":
			var equpment_dict = Character.get_equipment()
			for eq in equpment_dict.values():
				if eq != null:
					var req_rar = ItemsData.ITEM_LEVEL[req.rarity]
					var eq_rar = ItemsData.ITEM_LEVEL[eq.rarity]
					if eq_rar < req_rar:
						return false
				else:
					return false
			return true
