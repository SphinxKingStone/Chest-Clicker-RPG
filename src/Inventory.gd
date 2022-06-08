extends Node

var silver = 0
var inventory = []

func _ready():
	pass 

func get_inventory():
	return inventory

func add_item(item):
	if item == null:
		print_debug("Warning null item in add_item Inventory")
		return
	inventory.append(item)

func remove_item(item):
	inventory.erase(item)
