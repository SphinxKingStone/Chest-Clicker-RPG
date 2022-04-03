extends Node

var stats = ["damage", "health", "defense", "strength", "dexterity", "endurance", "dodge", "critical", "block", "bonus_rarity"]
var damage_values = {
	1: [10, 20],
	2: [20, 30],
	3: [20, 30],
}

func _ready():
	pass 

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
	for i in stats_count:
		# TODO it should be not stats, it should be stats according to item base type
		var stat_name = stats[ItemGenerator.rng.randi_range(0, stats.size() - 1)]
		var stat_level = ItemGenerator.rng.randi_range(1, item_level)
		if ItemGenerator.rng.randi_range(1, 10) == 10: #10 = CHANCE TO ROLL BONUS STAT LEVEL
			stat_level += 1
		
		var stat_value = ItemGenerator.rng.randf_range(damage_values[stat_level][0], damage_values[stat_level][1])
		stat_value = stepify(stat_value, 0.1)
		var stat = [stat_name, stat_value]
		print_debug(stat)
		generated_stats.append(stat)
	print_debug("-----------------------")
	return generated_stats
