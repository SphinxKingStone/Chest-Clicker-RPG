extends Node


var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func generate_item():
	var rarity = "WHITE"
	var my_random_number = rng.randi_range(0, ItemsStorage.white_items.size() - 1)
	var item = ItemsStorage.white_items[my_random_number]
	return item
