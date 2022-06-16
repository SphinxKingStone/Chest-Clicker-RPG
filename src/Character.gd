extends Node

var Equipment = preload("res://src/Equipment.gd").new()
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

signal item_equipped

func _ready():
	update_stats()

func get_stat_value(stat):
	if !stats.has(stat):
		return false
	
	return stats[stat]

func get_stats():
	return stats

func get_inventory():
	return Inventory.get_inventory()

func set_equipment(eq):
	Equipment.set_equipment(eq)

func get_equipment():
	return Equipment.get_equipment()

func equip_item(item):
	var unequipped_items = Equipment.equip_item(item.duplicate(true))
	for unequipped_item in unequipped_items:
		Character.add_item(unequipped_item)
	Audio.play_sound(ResourceManager.SOUNDS["EQUIP"])
	update_stats()
	ItemGenerator.update_min_number() # rng boost thing
	emit_signal("item_equipped")

func add_item(item):
	Inventory.add_item(item)

func remove_item(item):
	Inventory.remove_item(item)

func sort_inventory(sort_method = "sort_rarity", item_categories = []):
	return Inventory.sort_inventory(sort_method, item_categories)

func update_stats():
	for key in stats:
		stats[key] = 0
	
	# iterating through all our equiped gear and updating stats
	for item in Equipment.get_equipment().values():
		if item != null:
			for base_stat in item.base_stats:
				stats[base_stat.name] += base_stat.value
			for stat in item.stats:
				stats[stat.name] += stat.value

# return only stats that will change if item is equpped 
func stats_if_equipped(equip_item):
	# our stats if we will equip new item
	var if_equipped_stats = stats.duplicate(true)
	
	# "unequipping" old item
	for current_item in Equipment.get_equipment().values():
		if current_item != null:
			if current_item.category == equip_item.category:
				for stat in current_item.stats:
					if_equipped_stats[stat.name] -= stat.value
				for stat in current_item.base_stats:
					if_equipped_stats[stat.name] -= stat.value
	
	# "equipping" new item
#	for current_item in Equipment.get_equipment().values():
#		if current_item != null:
#			if current_item.category == equip_item.category:
	for stat in equip_item.stats:
		if_equipped_stats[stat.name] += stat.value
	for stat in equip_item.base_stats:
		if_equipped_stats[stat.name] += stat.value
	
	return if_equipped_stats

# base crit % = 150%
# crit_chance = stats["critical"] / 100 + 150%
# str gives bonus to damage that equals str/20 and applies after crit bonus if it's a crit
# str increases base crit % by str/10. So with 100 strength crit bonus = 150% + 10% = 160%
func get_average_damage(use_stats):
	var damage = use_stats["damage"]
	var bonus_dmg_to_crit = 1.5
	bonus_dmg_to_crit += (use_stats["strength"] / 10) / 100
	var crit_chance = (use_stats["critical"] / 100)
	var bonus_dmg = use_stats["strength"] / 20
	
	var crit_dmg = (damage * bonus_dmg_to_crit) * crit_chance
	
	damage += bonus_dmg
	
	var avg_damage = damage + crit_dmg
	
	return stepify(avg_damage, 0.1)

