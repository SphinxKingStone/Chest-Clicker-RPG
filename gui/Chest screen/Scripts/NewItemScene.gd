extends Panel


func _ready():
	$HBoxContainer/SellButton.connect("pressed", self, "sell_item")
	$HBoxContainer/EquipButton.connect("pressed", self, "equip_item")
	pass # Replace with function body.

func sell_item():
	hide()
	pass

func equip_item():
	hide()
	pass
