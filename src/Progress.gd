extends Node

var highest_rarity = 1
var last_item_new_rarity = false
var total_chests = 0
var total_items = 0
var total_rarities = {
	"WHITE": 0,
	"GREEN": 0,
	"BLUE": 0,
	"PURPLE": 0,
	"YELLOW": 0,
	"RED": 0,
}
 
func _ready():
	pass

func track_item(item):
	total_items += 1
	total_rarities[item.rarity] += 1
	last_item_new_rarity = false
	
	if highest_rarity < ItemsData.ITEM_LEVEL[item.rarity]:
		last_item_new_rarity = true
		Input.vibrate_handheld(50)
		highest_rarity = ItemsData.ITEM_LEVEL[item.rarity]
		print_debug("New Rarity!")

func increase_total_chests(amount = 1):
	total_chests += 1
