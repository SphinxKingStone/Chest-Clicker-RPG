extends Panel


func _ready():
	#warning-ignore:return_value_discarded
	$HBoxContainer/SellButton.connect("pressed", self, "sell_item")
	#warning-ignore:return_value_discarded
	$HBoxContainer/EquipButton.connect("pressed", self, "equip_item")

func show_item(item):
	self.show()
	
	# Setting new item background color
	$ItemBackground.set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS[item.rarity])
	
	# Setting new items texture and name
	$ItemBackground/ItemTexture.texture = item.texture
	$ItemName.text = item.name
	
	# Clearing base stats
	for node in get_node("BaseStats").get_children():
		node.text = ""
	
	# Showing base stats in new item window
	for stat in item.base_stats:
		var value = stat.value
		var text = stat.name + ": " + str(value)
		if stat.name == "rarity":
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
		var text = stat.name + ": " + str(stat.value)
		text[0] = text[0].to_upper()
		get_node("Stats/" + str(count)).text = text
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
	Audio.play_sound(ResourceManager.SOUNDS["COINS" + str(ItemGenerator.rng.randi_range(1, 10))])
	self.hide()
	
func equip_item():
	clear_stats()
	
	Character.equip_item(ItemGenerator.item)
	get_parent().get_node("EquipmentScene").update_inventory()
	Audio.play_sound(ResourceManager.SOUNDS["EQUIP"])
	self.hide()

func clear_stats():
	# clear bonus avg stats
	get_parent().get_node("AverageStats/Attack/AttackBonus").text = ""
	get_parent().get_node("AverageStats/Health/HealthBonus").text = ""
	
	# Clearing bonus text in stats
	get_parent().get_node("StatsScene").clear_bonus_text()
