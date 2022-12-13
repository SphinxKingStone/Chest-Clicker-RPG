extends Node

var item # it holds last generated item
var rng = RandomNumberGenerator.new()
var min_number = 0
var generated_items_amount = 0
var gold_chest = false

func _init():
	rng.randomize()

func _ready():
	update_min_number()

func generate_item():
	# rolling item rarity
	var rarity = roll_rarity()
	
	# acting if gold_chest
	if gold_chest:
		var second_r
		for i in 5:
			second_r = roll_rarity()
			if ItemsData.ITEM_LEVEL[second_r] >  ItemsData.ITEM_LEVEL[rarity]:
				rarity = second_r
				gold_chest = false
				break
			gold_chest = false
	
	# rolling item base
	roll_item_base(rarity)
	
	#generating stats
	item.stats = generate_stats()
	item.base_stats = generate_base_stats()
	
	#unique id to help compare items with different references
	item.id = generated_items_amount
	generated_items_amount += 1
	
	# testing for gold_chest
	if rng.randi_range(1, 100) > 80:
		gold_chest = true
	
	return item

func update_min_number():
	min_number = 5
	for equipped_item in Character.Equipment.get_equipment().values():
		if equipped_item != null:
			min_number += ItemsData.ITEM_LEVEL[equipped_item.rarity]
			if equipped_item.category == "two_handed":
				min_number += ItemsData.ITEM_LEVEL[equipped_item.rarity]

func generate_base_stats():
	var generated_stats = []
	for stat in item.base_stats_data:
		var stat_name = stat
		var stat_value = ItemGenerator.rng.randf_range(item.base_stats_data[stat][0], item.base_stats_data[stat][1])
		stat_value = stepify(stat_value, 0.1)
		var base_stat = {"name": stat_name, "value": stat_value}
		generated_stats.append(base_stat)
	
	return generated_stats

func generate_stats():
	var item_level = ItemsData.ITEM_LEVEL[item.rarity] # AKA rarity
	var stats_count = ItemGenerator.rng.randi_range(1, item_level)
	var generated_stats = []
	var stats_pool = StatsData.get(item.category+"_stats")
	var generated_names = [] # helps to prevent rolling stat twice
	
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
#		var stat = [stat_name, stat_value]
		var stat = {"name": stat_name, "value": stat_value, "tier": stat_tier}
		generated_stats.append(stat)
	
	return generated_stats

func roll_rarity():
	var rng_number = rng.randi_range(111, 100 + min_number) # 1 and 100 are both possible
	min_number = 1145
	rng_number += min_number
	
	var rarity
	if rng_number > 150:
		rarity = "RED"
	elif rng_number > 138:
		rarity = "YELLOW"
	elif rng_number > 130:
		rarity = "PURPLE"
	elif rng_number > 113: # 7% at all greens
		rarity = "BLUE"
	elif rng_number > 95: # 5%
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
		"PURPLE":
			var my_random_number = rng.randi_range(0, ItemsStorage.purple_items.size() - 1)
			item = ItemsStorage.purple_items[my_random_number]
			item.cost = rng.randi_range(40, 75)
		"YELLOW":
			var my_random_number = rng.randi_range(0, ItemsStorage.yellow_items.size() - 1)
			item = ItemsStorage.yellow_items[my_random_number]
			item.cost = rng.randi_range(80, 125)
		"RED":
			var my_random_number = rng.randi_range(0, ItemsStorage.red_items.size() - 1)
			item = ItemsStorage.red_items[my_random_number]
			item.cost = rng.randi_range(126, 220)
