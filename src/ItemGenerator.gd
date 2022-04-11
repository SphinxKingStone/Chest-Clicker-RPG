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
	var generated_stats = generate_stats(item)
	item.stats = generated_stats
	return item

func generate_stats(item):
	var item_level
	match item.rarity:
		"WHITE":
			item_level = 1
		"GREEN":
			item_level = 2
		"BLUE":
			item_level = 3
	var stats_count = ItemGenerator.rng.randi_range(1, item_level)
	var generated_stats = []
	print_debug(Stats.get(item.category+"_stats")) # how to do stats
	for i in stats_count:
		# TODO it should be not stats, it should be stats according to item base type
		var stat_name = Stats.stats_names[ItemGenerator.rng.randi_range(0, Stats.stats_names.size() - 1)]
		var stat_level = ItemGenerator.rng.randi_range(1, item_level)
		if ItemGenerator.rng.randi_range(1, 10) == 10: #10 = CHANCE TO ROLL BONUS STAT LEVEL
			stat_level += 1
		
		var selected_stat = Stats.stats_values[stat_name][stat_level]
		var stat_value = ItemGenerator.rng.randf_range(selected_stat.min, selected_stat.max)
		stat_value = stepify(stat_value, 0.1)
		var stat = [stat_name, stat_value]
#		print_debug(stat)
		generated_stats.append(stat)
#	print_debug("-----------------------")
	return generated_stats
