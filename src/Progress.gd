extends Node

var highest_rarity = 1

func _ready():
	pass 

func check_item(item):
	if highest_rarity < ItemsData.ITEM_LEVEL[item.rarity]:
		Input.vibrate_handheld(50)
		highest_rarity = ItemsData.ITEM_LEVEL[item.rarity]
		print_debug("New Rarity!")

