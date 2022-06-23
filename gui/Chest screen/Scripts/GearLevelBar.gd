extends TextureProgress


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Character.connect("item_equipped", self, "update_bar")

func update_bar():
	var item_level = 0
	var gear_level = 0
	for item in Character.get_equipment().values():
		if item != null:
			item_level += ItemsData.ITEM_LEVEL[item.rarity]
	gear_level = floor(item_level/10)
	get_parent().get_node("GearLevelNumber").text = str(gear_level)
	match str(gear_level):
		"0":
			get_parent().get_node("GearLevelNumber").set("custom_colors/font_color", Color("cececece"))
			get_parent().get_node("GearLevelText").set("custom_colors/font_color", Color("cececece"))
		"1":
			get_parent().get_node("GearLevelNumber").set("custom_colors/font_color", Color("0ac122"))
			get_parent().get_node("GearLevelText").set("custom_colors/font_color", Color("0ac122"))
		"2":
			get_parent().get_node("GearLevelNumber").set("custom_colors/font_color", Color("0d63d2"))
			get_parent().get_node("GearLevelText").set("custom_colors/font_color", Color("0d63d2"))
		"3":
			get_parent().get_node("GearLevelNumber").set("custom_colors/font_color", Color("790dd2"))
			get_parent().get_node("GearLevelText").set("custom_colors/font_color", Color("790dd2"))
		"4":
			get_parent().get_node("GearLevelNumber").set("custom_colors/font_color", Color("ebdd0f"))
			get_parent().get_node("GearLevelText").set("custom_colors/font_color", Color("ebdd0f"))
	self.value = item_level % 10
