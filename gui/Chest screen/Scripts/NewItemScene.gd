extends Panel


func _ready():
	$HBoxContainer/SellButton.connect("pressed", self, "sell_item")
	$HBoxContainer/EquipButton.connect("pressed", self, "equip_item")
	pass # Replace with function body.

func show_item(item):
	self.show()
	$ItemBackground/ItemTexture.texture = item.texture
	$ItemName.text = item.name
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

func sell_item():
	Inventory.silver += ItemGenerator.item.cost
	get_parent().get_node("InventoryScene").update_silver()
	self.hide()
	
func equip_item():
	self.hide()
	Inventory.equip_item(ItemGenerator.item)
	get_parent().get_node("InventoryScene").update_inventory()

