extends Panel

func _ready():
	Character.connect("stats_updated", self, "update_stats")
	pass 

func update_stats():
	var stats = Character.get_stats()
	for key in stats:
		var node = get_node(str("ScrollContainer2/GridContainer/"+key))
		var value = str(stats[key])
		if node.name in ["dodge", "critical", "block", "bonus_rarity"]:
			value += "%"
		node.text = value
	
