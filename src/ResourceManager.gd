extends Node

const Colors = preload("res://assets/data/Colors.gd")

const ITEM_BACKGROUNDS = {
	"GREY": preload("res://assets/StyleBoxes/item_light_gray_bg.tres"), # for no item
	"WHITE": preload("res://assets/StyleBoxes/item_gray_bg.tres"),
	"GREEN": preload("res://assets/StyleBoxes/item_green_bg.tres"),
	"BLUE": preload("res://assets/StyleBoxes/item_blue_bg.tres"),
	"PURPLE": preload("res://assets/StyleBoxes/item_purple_bg.tres"),
}

const PARTICLES_COLORS = {
	"GREEN": preload("res://assets/particle materials/green_color_ramp.tres"),
	"BLUE": preload("res://assets/particle materials/blue_color_ramp.tres"),
	"PURPLE": preload("res://assets/particle materials/purple_color_ramp.tres"),
}

func _ready():
	pass
