extends Node

var Inventory = preload("res://src/Inventory.gd").new()

var stats = {
	"damage": 0, 
	"health": 0,  
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

func get_stat(stat):
	if !stats.has(stat):
		return false
	
	return stats[stat]

func get_stats():
	return stats

func equip_item(item):
	Inventory.equip_item(item)
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

func _ready():
	pass 
