extends Panel


func _ready():
	$HBoxContainer/SellButton.connect("pressed", self, "sell_item")
	$HBoxContainer/EquipButton.connect("pressed", self, "equip_item")
	pass # Replace with function body.

func show_item(item):
	self.show()
	$ItemBackground/ItemTexture.texture = item.image
	$ItemName.text = item.name
	for stat in item.base_stats:
		var value = item.base_stats[stat]
		print_debug(value)
		if typeof(value) == TYPE_ARRAY:
			value = stepify(ItemGenerator.rng.randf_range(value[0], value[1]), 0.1)
		var text = stat + ": +" + str(value)
		if stat == "rarity":
			text += "%"
		text[0] = text[0].to_upper()
		get_node("BaseStats/1").text = text

func sell_item():
	hide()
	pass

func equip_item():
	hide()
	pass
