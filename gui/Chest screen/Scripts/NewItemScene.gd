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
	
	# Clearing stats
	for node in get_node("Stats").get_children():
		node.text = ""
	
	# Showing stats in new item window
	var count = 1 # helps to iterate through new item stats labels
	for stat in item.stats:
		get_node("Stats/" + str(count)).text = stat[0] + ": " + str(stat[1])
		count += 1

func sell_item():
	Inventory.silver += ItemGenerator.item.cost
	get_parent().get_node("InventoryScene").update_silver()
	self.hide()
	
func equip_item():
	self.hide()
	Inventory.equip_item(ItemGenerator.item)
	get_parent().get_node("InventoryScene").update_inventory()

