extends Panel

func _ready():
	#warning-ignore:return_value_discarded
	Character.connect("stats_updated", self, "update_stats")
	pass 

func update_stats():
	# updating stats
	var stats = Character.get_stats()
	for key in stats:
		var node = get_stat_value_node(key)#get_node(str("ScrollContainer/VBoxContainer/"+key+"Panel/"+key+"/"+key+"Value"))
		var value = str(stats[key])
		if key in ["dodge", "critical", "block", "bonus_rarity"]:
			value += "%"
		node.text = value
	
	# updating avg stats
	for key in stats:
		if key == "damage":
			get_parent().get_node("AverageStats/Attack/AttackValue").text = str(stats[key])
		if key == "life":
			get_parent().get_node("AverageStats/Health/HealthValue").text = str(stats[key])

func get_stat_value_node(stat):
	return get_node("ScrollContainer/VBoxContainer/" + stat + "Panel/" + stat + "/" + stat + "Value")

func get_stat_bonus_node(stat):
	return get_node("ScrollContainer/VBoxContainer/" + stat + "Panel/" + stat + "/" + stat + "Bonus")

func clear_bonus_text():
	for n1 in get_node("ScrollContainer/VBoxContainer").get_children():
		for n2 in n1.get_children():
			for child in n2.get_children():
				if "Bonus" in child.name:
					child.text = ""
