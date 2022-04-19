extends Node

var Inventory = preload("res://src/Inventory.gd").new()

var stats = {
	"damage": 0, 
	"life": 0,  
	"defense": 0,  
	"strength": 0,  
	"dexterity": 0,  
	"endurance": 0, 
	"dodge": 0, 
	"critical": 0,  
	"block": 0, 
	"bonus_rarity": 0, 
}

signal stats_updated

func get_stat_value(stat):
	if !stats.has(stat):
		return false
	
	return stats[stat]

func get_stats():
	return stats

func equip_item(item):
	Inventory.equip_item(item.duplicate(true))
	update_stats()
	emit_signal("stats_updated")

func update_stats():
	for key in stats:
		stats[key] = 0
	
	# iterating through all out equiped gear and updating stats
	for item in Inventory.get_gear().values():
		if item != null:
			for stat in item.stats:
				stats[stat.name] += stat.value

# return only stats that will change if item is equpped 
func stats_if_equipped(equip_item):
	# our stats if we will equip new item
	var if_equipped_stats = stats.duplicate(true)
	
	# "unequipping" old item
	for current_item in Inventory.get_gear().values():
		if current_item != null:
			if current_item.category == equip_item.category:
				for stat in current_item.stats:
					if_equipped_stats[stat.name] -= stat.value
	
	# "equipping" new item
#	for current_item in Inventory.get_gear().values():
#		if current_item != null:
#			if current_item.category == equip_item.category:
	for stat in equip_item.stats:
		if_equipped_stats[stat.name] += stat.value
	
	print_debug(stats)
	print_debug(if_equipped_stats)
	return if_equipped_stats

func _ready():
	pass 
