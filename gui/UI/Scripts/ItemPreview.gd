extends Panel


func _ready():
	pass 

func set_item_data(item):
	# Clearing data
	for ch in get_node("Stats").get_children():
		ch.text = ""
	for ch in get_node("BaseStats").get_children():
		ch.text = ""
	
	# Showing name
	var ff = get_node("ItemName").get("custom_fonts/font")
	ff.size = 42
	if tr(item.name).length() > 14:
		var extra_chars = tr(item.name).length() - 14
		ff.size = ff.size - extra_chars * 1.5
	get_node("ItemName").set("custom_fonts/font", ff)
	get_node("ItemName").text = item.name
	
	# Showing base stats
	var count = 1
	for stat in item.base_stats:
		var text = tr(stat.name.to_upper()) + ": " + str(stat.value)
		text[0] = text[0].to_upper()
		if stat.name in ["dodge", "critical", "block", "bonus_rarity"]:
			text += "%"
		get_node("BaseStats/"+str(count)).text = text
		count += 1
	
	# Showing stats
	count = 1
	for stat in item.stats:
		var text = tr(stat.name.to_upper()) + ": " + str(stat.value)
		text[0] = text[0].to_upper()
		if stat.name in ["dodge", "critical", "block", "bonus_rarity"]:
			text += "%"
		get_node("Stats/"+str(count)).text = text
		count += 1
