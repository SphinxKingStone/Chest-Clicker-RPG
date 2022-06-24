extends Panel


func _ready():
	#warning-ignore:return_value_discarded
	$HBoxContainer/SellButton.connect("pressed", self, "sell_item")
	#warning-ignore:return_value_discarded
	$HBoxContainer/EquipButton.connect("pressed", self, "equip_item")
	#warning-ignore:return_value_discarded
	$HBoxContainer/SaveButton.connect("pressed", self, "save_item")
	
	get_parent().get_node("ChestScene").connect("chest_opened", self, "show_item")

func show_item(item = ItemGenerator.item):
	self.show()
	
	# Temporary audio part
	if item.rarity == "BLUE":
		Audio.play_sound(load("res://assets/Sounds/Sounds/win1.wav"))
	elif item.rarity == "PURPLE":
		Audio.play_sound(load("res://assets/Sounds/Sounds/win3.wav"))
	elif item.rarity == "YELLOW":
		Audio.play_sound(load("res://assets/Sounds/Sounds/win2.wav"))
#	elif item.rarity == "GREEN":
#		Audio.play_sound(load("res://assets/Sounds/Sounds/win2.wav"))
	
	# Temporary progress check
	Progress.track_item(item)
	Achievements.check_achievements()
	
	# Setting new item background color
	$ItemBackground.set("custom_styles/panel", ResourceManager.ITEM_BACKGROUNDS[item.rarity])
	
	# Setting new items texture, name and other stuff
	$ItemBackground/ItemTexture.texture = item.texture
	$ItemName.text = item.name
	$Cost.text = str(item.cost)
	$ItemCategoy.text = item.category.to_upper()
	$ItemRarity.text = item.rarity.to_upper()
	
	var part = $ItemBackground/Particles2D
	var amount = (ItemsData.ITEM_LEVEL[item.rarity]-3) * 4
	if amount > 0:
		part.emitting = true
		part.self_modulate.a = 1
		part.amount = amount
	else:
		part.emitting = false
		part.self_modulate.a = 0
	
	# Clearing base and main stats
	clear_stats()
	
	# Showing base stats in new item window
	for stat in item.base_stats:
		var value = stat.value
		var text = tr(stat.name.to_upper()) + ": " + str(value)
		if stat.name in ["dodge", "critical", "block", "bonus_rarity"]:
			text += "%"
		text[0] = text[0].to_upper()
		
		var new_stat_node = $BaseStats/HBoxContainer.duplicate()
		new_stat_node.visible = true
		new_stat_node.get_node("stat").text = text
		$BaseStats.add_child(new_stat_node)
	
	# Showing stats in new item window
	var count = 1 # helps to iterate through new item stats labels
	for stat in item.stats:
		var text = tr(stat.name.to_upper()) + ": " + str(stat.value)
		if stat.name in ["dodge", "critical", "block", "bonus_rarity"]:
			text += "%"
		text[0] = text[0].to_upper()
		
		var new_stat_node = $Stats/HBoxContainer.duplicate()
		new_stat_node.visible = true
		new_stat_node.get_node("stat").text = text
		new_stat_node.get_node("tier").text = "(t" + str(stat.tier) + ")"
		$Stats.add_child(new_stat_node)
		
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
	var current_avg_dmg =  Character.get_average_damage(Character.stats)
	var if_equipped_avg_dmg = Character.get_average_damage(stats_if_equipped)
	if current_avg_dmg < if_equipped_avg_dmg:
		var diff = if_equipped_avg_dmg - current_avg_dmg
		get_parent().get_node("AverageStats/Attack/AttackBonus").text = " (+" + str(diff) + ")" 
		get_parent().get_node("AverageStats/Attack/AttackBonus").set("custom_colors/font_color", ResourceManager.Colors.bonus_text_green)
	elif current_avg_dmg > if_equipped_avg_dmg:
		var diff = current_avg_dmg - if_equipped_avg_dmg
		get_parent().get_node("AverageStats/Attack/AttackBonus").text = " (-" + str(diff) + ")" 
		get_parent().get_node("AverageStats/Attack/AttackBonus").set("custom_colors/font_color", ResourceManager.Colors.bonus_text_red)
	

func sell_item():
	clear_comparison_stats()
	
	Character.Inventory.silver += ItemGenerator.item.cost
	get_parent().get_node("EquipmentScene").update_silver()
	Audio.play_sound(ResourceManager.SOUNDS["COINS" + str(ItemGenerator.rng.randi_range(1, 10))])
	self.hide()
	
func equip_item():
	clear_comparison_stats()
	
	Character.equip_item(ItemGenerator.item)
	get_parent().get_node("EquipmentScene").update_equipment()
	self.hide()

func save_item():
	clear_comparison_stats()
	
	Character.add_item(ItemGenerator.item)
#	get_parent().get_node("EquipmentScene").update_equipment()
#	Audio.play_sound(ResourceManager.SOUNDS["EQUIP"])
	self.hide()

func clear_comparison_stats():
	# clear bonus avg stats
	get_parent().get_node("AverageStats/Attack/AttackBonus").text = ""
	get_parent().get_node("AverageStats/Health/HealthBonus").text = ""
	
	# Clearing bonus text in stats
	get_parent().get_node("StatsScene").clear_bonus_text()

func clear_stats():
	var to_remove = []
	for child in $Stats.get_children():
		if child.visible:
			child.queue_free()
	for child in $BaseStats.get_children():
		if child.visible:
			child.queue_free()
