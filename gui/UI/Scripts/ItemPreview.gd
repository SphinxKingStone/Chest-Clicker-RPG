extends Panel


func _ready():
	pass 

func set_item_data(item):
	# Clearing data
	clear_stats()
	
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
		
		var new_stat_node = $BaseStats/HBoxContainer.duplicate()
		new_stat_node.visible = true
		new_stat_node.get_node("stat").text = text
		$BaseStats.add_child(new_stat_node)
		
		count += 1
	
	# Showing stats
	count = 1
	for stat in item.stats:
		var text = tr(stat.name.to_upper()) + ": " + str(stat.value)
		text[0] = text[0].to_upper()
		if stat.name in ["dodge", "critical", "block", "bonus_rarity"]:
			text += "%"
			
		var new_stat_node = $Stats/HBoxContainer.duplicate()
		new_stat_node.visible = true
		new_stat_node.get_node("stat").text = text
		new_stat_node.get_node("tier").text = "(t" + str(stat.tier) + ")"
		if stat.tier > 6:
			new_stat_node.get_node("stat").set("custom_colors/font_color", ResourceManager.bonus_text_purple)
			new_stat_node.get_node("tier").set("custom_colors/font_color", ResourceManager.bonus_text_purple)
		$Stats.add_child(new_stat_node)
		
		count += 1

func clear_stats():
	var to_remove = []
	for child in $Stats.get_children():
		if child.visible:
			child.queue_free()
	for child in $BaseStats.get_children():
		if child.visible:
			child.queue_free()
