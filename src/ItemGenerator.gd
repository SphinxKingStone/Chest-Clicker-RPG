extends Node

var item

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func generate_item():
	var rarity
	if rng.randi_range(0, 15) >= 15:
		rarity = "GREEN"
	else:
		rarity = "WHITE"
	match rarity:
		"WHITE":
			var my_random_number = rng.randi_range(0, ItemsStorage.white_items.size() - 1)
			item = ItemsStorage.white_items[my_random_number]
		"GREEN":
			var my_random_number = rng.randi_range(0, ItemsStorage.green_items.size() - 1)
			item = ItemsStorage.green_items[my_random_number]
	return item
