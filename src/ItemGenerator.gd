extends Node

var item

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func generate_item():
	var rarity
	var rng_number = rng.randi_range(0, 25)
#	rarity = "BLUE"
	if rng_number >= 17:
		rarity = "BLUE"
	elif rng_number >= 9:
		rarity = "GREEN"
	else:
		rarity = "WHITE"
	match rarity:
		"WHITE":
			var my_random_number = rng.randi_range(0, ItemsStorage.white_items.size() - 1)
			item = ItemsStorage.white_items[my_random_number]
			item.cost = rng.randi_range(2, 9)
		"GREEN":
			var my_random_number = rng.randi_range(0, ItemsStorage.green_items.size() - 1)
			item = ItemsStorage.green_items[my_random_number]
			item.cost = rng.randi_range(15, 35)
		"BLUE":
			var my_random_number = rng.randi_range(0, ItemsStorage.blue_items.size() - 1)
			item = ItemsStorage.blue_items[my_random_number]
			item.cost = rng.randi_range(30, 35)
	Stats.generate_stats(item)
	return item
