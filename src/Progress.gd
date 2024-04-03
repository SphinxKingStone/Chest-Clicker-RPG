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

var total_tiers = {
	"T1": 0,
	"T2": 0,
	"T3": 0,
	"T4": 0,
	"T5": 0,
	"T6": 0,
	"T7": 0,
	"T8": 0,
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
	
	for s in item.stats:
		total_tiers["T"+str(s.tier)] += 1

func increase_total_chests(amount = 1):
	total_chests += 1
