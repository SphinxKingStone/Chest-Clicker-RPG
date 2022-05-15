extends Panel


func _ready():
	pass 

func update_stats(item):
	# Clearing data
	for ch in get_node("Stats").get_children():
		ch.text = ""
	for ch in get_node("BaseStats").get_children():
		ch.text = ""
	
	# Showing name
	get_node("ItemName").text = item.name
	
	# Showing base stats
	var count = 1
	for stat in item.base_stats:
		var text = stat.name + ": " + str(stat.value)
		text[0] = text[0].to_upper()
		if stat.name in ["dodge", "critical", "block", "bonus_rarity"]:
			text += "%"
		get_node("BaseStats/"+str(count)).text = text
		count += 1
	
	# Showing stats
	count = 1
	for stat in item.stats:
		var text = stat.name + ": " + str(stat.value)
		text[0] = text[0].to_upper()
		if stat.name in ["dodge", "critical", "block", "bonus_rarity"]:
			text += "%"
		get_node("Stats/"+str(count)).text = text
		count += 1
