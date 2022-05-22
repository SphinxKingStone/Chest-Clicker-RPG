extends Node

var silver = 0
var inventory = []

func _ready():
	pass 

func get_inventory():
	return inventory

func add_item(item):
	inventory.append(item)
