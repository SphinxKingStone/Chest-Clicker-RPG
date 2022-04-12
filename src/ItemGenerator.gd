extends Node

var item # it holds last generated item
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func generate_item():
	#rolling item rarity
	var rarity = roll_rarity()
	
	# rolling item base
	roll_item_base(rarity)
	
	#generating stats
	item.stats = generate_stats(item)
	return item

func generate_stats(item):
	var item_level = Items.ITEM_LEVEL[item.rarity] # AKA rarity
	var stats_count = ItemGenerator.rng.randi_range(1, item_level)
	var generated_stats = []
	var stats_pool = Stats.get(item.category+"_stats")
	var generated_names:Array # helps to prevent rolling stat twice
	
	for i in stats_count:
		var stat_name = stats_pool.keys()[ItemGenerator.rng.randi_range(0, stats_pool.size() - 1)] 
		while generated_names.has(stat_name):
			stat_name = stats_pool.keys()[ItemGenerator.rng.randi_range(0, stats_pool.size() - 1)]
		generated_names.push_back(stat_name)
		var stat_tier = ItemGenerator.rng.randi_range(1, item_level) 
		
		# chancing tier 7 and 8
		if stat_tier == 6:
			var roll = ItemGenerator.rng.randi_range(1, 100)
			if roll > 95: # 5% chance
				stat_tier = 8
			elif roll >= 90: # 10% chance
				stat_tier = 7
		
		var selected_stat = stats_pool[stat_name][stat_tier]
		var stat_value = ItemGenerator.rng.randf_range(selected_stat.min, selected_stat.max)
		stat_value = stepify(stat_value, 0.1)
		var stat = [stat_name, stat_value]
		generated_stats.append(stat)
	
	return generated_stats

func roll_rarity():
	var rarity
	var rng_number = rng.randi_range(0, 25)
	if rng_number >= 17:
		rarity = "BLUE"
	elif rng_number >= 9:
		rarity = "GREEN"
	else:
		rarity = "WHITE"
	return rarity

func roll_item_base(rarity):
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
	
