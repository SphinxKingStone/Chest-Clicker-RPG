extends Node

const button_background_normal = Color("0eab00")
const button_background_pressed = Color("075400")
const bonus_text_green = Color("0fff00")
const bonus_text_red = Color("ff0000")
#const bonus_text_purple = Color("790dd2")
const bonus_text_purple = Color("7f5399")

const rarity_color = {
	0: Color("cececece"),
	1: Color("0ac122"),
	2: Color("0d63d2"),
	3: Color("790dd2"),
	4: Color("ebdd0f"),
	5: Color("cf240e"),
}

const ITEM_BACKGROUNDS = {
	"GREY": preload("res://assets/StyleBoxes/item_light_gray_bg.tres"), # for no item
	"WHITE": preload("res://assets/StyleBoxes/item_gray_bg.tres"),
	"GREEN": preload("res://assets/StyleBoxes/item_green_bg.tres"),
	"BLUE": preload("res://assets/StyleBoxes/item_blue_bg.tres"),
	"PURPLE": preload("res://assets/StyleBoxes/item_purple_bg.tres"),
	"YELLOW": preload("res://assets/StyleBoxes/item_yellow_bg.tres"),
	"RED": preload("res://assets/StyleBoxes/item_red_bg.tres"),
}

const PARTICLES_COLORS = {
	"GREEN": preload("res://assets/particle materials/green_color_ramp.tres"),
	"BLUE": preload("res://assets/particle materials/blue_color_ramp.tres"),
	"PURPLE": preload("res://assets/particle materials/purple_color_ramp.tres"),
	"YELLOW": preload("res://assets/particle materials/yellow_color_ramp.tres"),
	"RED": preload("res://assets/particle materials/red_color_ramp.tres"),
}

const SOUNDS = {
	"COINS1": preload("res://assets/Sounds/Sounds/coins/coins1.wav"),
	"COINS2": preload("res://assets/Sounds/Sounds/coins/coins2.wav"),
	"COINS3": preload("res://assets/Sounds/Sounds/coins/coins3.wav"), # https://soundimage.org/attribution-info/
	"COINS4": preload("res://assets/Sounds/Sounds/coins/coins4.wav"), # https://soundimage.org/attribution-info/
	"COINS5": preload("res://assets/Sounds/Sounds/coins/coins5.wav"), # https://soundimage.org/attribution-info/
	"COINS6": preload("res://assets/Sounds/Sounds/coins/coins6.wav"), # https://soundimage.org/attribution-info/
	"COINS7": preload("res://assets/Sounds/Sounds/coins/coins7.wav"), # https://soundimage.org/attribution-info/
	"COINS8": preload("res://assets/Sounds/Sounds/coins/coins8.wav"), # https://soundimage.org/attribution-info/
	"COINS9": preload("res://assets/Sounds/Sounds/coins/coins9.wav"), # https://soundimage.org/attribution-info/
	"COINS10": preload("res://assets/Sounds/Sounds/coins/coins10.wav"), # https://soundimage.org/attribution-info/
	"EQUIP":preload("res://assets/Sounds/Sounds/equip.wav"),
	"OPEN_INVENTORY": preload("res://assets/Sounds/Sounds/open_inventory.wav")
}

const MUSIC = {
	"BACKGROUND_MENU": preload("res://assets/Sounds/Music/bg_main_menu.ogg"),
	"BACKGROUND1": preload("res://assets/Sounds/Music/bg1.ogg"),
	"BACKGROUND2": preload("res://assets/Sounds/Music/bg2.ogg"),
	"BACKGROUND3": preload("res://assets/Sounds/Music/bg3.ogg"),
	"BACKGROUND4": preload("res://assets/Sounds/Music/bg4.ogg"),
}

const NODES = {
	"ITEM_PREVIEW": preload("res://gui/UI/Scenes/ItemPreview.tscn"),
	"ACHIEVEMENTPOPUP": preload("res://gui/UI/Scenes/AchievementPopUp.tscn"),
}

var item_info_children = []

func _ready():
	pass

func clear_item_info_children():
	for i in item_info_children:
		i.get_parent().remove_child(i)
		item_info_children.erase(i)
		i.queue_free()
