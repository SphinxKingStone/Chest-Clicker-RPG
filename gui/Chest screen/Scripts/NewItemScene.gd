extends Panel


func _ready():
	$HBoxContainer/SellButton.connect("pressed", self, "sell_item")
	$HBoxContainer/EquipButton.connect("pressed", self, "equip_item")
	pass # Replace with function body.

func show_item(item):
	show()
	$ItemBackground/ItemTexture.texture = item.image
	$ItemName.text = item.name
	for s in item.base_stats:
		print_debug(s)

func sell_item():
	hide()
	pass

func equip_item():
	hide()
	pass
