extends Panel


func _ready():
	$HBoxContainer/SellButton.connect("pressed", self, "sell_item")
	$HBoxContainer/EquipButton.connect("pressed", self, "equip_item")

func show_item(item):
	self.show()
	
	# Setting new item background color
	match item.rarity:
		"WHITE":
			$ItemBackground.set("custom_styles/panel", load("res://assets/StyleBoxes/gray_item_bg.tres"))
		"GREEN":
			$ItemBackground.set("custom_styles/panel", load("res://assets/StyleBoxes/green_item_bg.tres"))
		"BLUE":
			$ItemBackground.set("custom_styles/panel", load("res://assets/StyleBoxes/blue_item_bg.tres"))
	
	# Setting new items texture and name
	$ItemBackground/ItemTexture.texture = item.texture
	$ItemName.text = item.name
	
	# Clearing base stats
	for node in get_node("BaseStats").get_children():
		node.text = ""
	
	# Showing base stats in new item window
	for stat in item.base_stats:
		var value = item.base_stats[stat]
		if typeof(value) == TYPE_ARRAY:
			value = stepify(ItemGenerator.rng.randf_range(value[0], value[1]), 0.1)
		var text = stat + ": +" + str(value)
		if stat == "rarity":
			text += "%"
		text[0] = text[0].to_upper()
		get_node("BaseStats/1").text = text
		$Cost.text = str(item.cost)
	
	# Clearing stats and avg stats
	for node in get_node("Stats").get_children():
		node.text = ""
	
	# Showing stats in new item window
	var count = 1 # helps to iterate through new item stats labels
	for stat in item.stats:
		get_node("Stats/" + str(count)).text = stat.name + ": " + str(stat.value)
		count += 1
	
	# Clearing bonus text in stats
	get_parent().get_node("StatsScene").clear_bonus_text()
	
	# Show difference (bonus) if item is equipped in stats
	var stats_if_equipped = Character.stats_if_equipped(item)
	for eq_stat in stats_if_equipped:
		var current_stat = Character.get_stat_value(eq_stat)
		if current_stat != stats_if_equipped[eq_stat]:
			var bonus_node = get_parent().get_node("StatsScene").get_stat_bonus_node(eq_stat)
			var difference
			var bonus_text
			if current_stat > stats_if_equipped[eq_stat]: 
				difference = current_stat - stats_if_equipped[eq_stat]
				bonus_node.set("custom_colors/font_color", ResourceManager.Colors.bonus_text_red)
				if eq_stat in ["dodge", "critical", "block", "bonus_rarity"]:
					bonus_text = " (-" + str(difference) + "%)"
				else:
					bonus_text = " (-" + str(difference) + ")"
			else:
				difference = stats_if_equipped[eq_stat] - current_stat
				bonus_node.set("custom_colors/font_color", ResourceManager.Colors.bonus_text_green)
				if eq_stat in ["dodge", "critical", "block", "bonus_rarity"]:
					bonus_text = " (+" + str(difference) + "%)"
				else:
					bonus_text = " (+" + str(difference) + ")"
			bonus_node.text = bonus_text
	
	# Show difference if item equipped in avg stats
	for stat in item.stats:
		if stat.name == "damage": # change stat value to calculated attack
			get_parent().get_node("AverageStats/Attack/AttackBonus").text = " (+" + str(stat.value) + ")" 
		if stat.name == "life": # change stat value to calculated health
			get_parent().get_node("AverageStats/Health/HealthBonus").text = " (+" + str(stat.value) + ")"

func sell_item():
	clear_stats()
	
	Character.Inventory.silver += ItemGenerator.item.cost
	get_parent().get_node("EquipmentScene").update_silver()
	self.hide()
	
func equip_item():
	clear_stats()
	
	Character.equip_item(ItemGenerator.item)
	get_parent().get_node("EquipmentScene").update_inventory()
	self.hide()

func clear_stats():
	# clear bonus avg stats
	get_parent().get_node("AverageStats/Attack/AttackBonus").text = ""
	get_parent().get_node("AverageStats/Health/HealthBonus").text = ""
	
	# Clearing bonus text in stats
	get_parent().get_node("StatsScene").clear_bonus_text()
