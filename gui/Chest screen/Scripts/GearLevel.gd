extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Character.connect("item_equipped", self, "update_bar")

func update_bar():
	var item_level = 0
	var gear_level = 0
	var old_gear_level= get_node("GearLevelNumber").text.to_int()
	for item in Character.get_equipment().values():
		if item != null:
			item_level += ItemsData.ITEM_LEVEL[item.rarity]
			if item.category == "two_handed":
				item_level += ItemsData.ITEM_LEVEL[item.rarity]
	gear_level = floor(item_level/10)
	
	var old_value = get_node("GearLevelBar").value
	var new_value = (item_level % 10) * 100
	$Tween.start()
	if gear_level > old_gear_level:
		$Tween.interpolate_property($GearLevelBar, "value", old_value, 1000, 1.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		$Tween.interpolate_property($GearLevelBar, "value", 0, new_value, 1.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	elif gear_level < old_gear_level:
		$Tween.interpolate_property($GearLevelBar, "value", old_value, 0, 1.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		$Tween.interpolate_property($GearLevelBar, "value", 1000, new_value, 1.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	else:
		$Tween.interpolate_property($GearLevelBar, "value", old_value, new_value, 1.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	
	get_node("GearLevelNumber").text = str(gear_level)
	match str(gear_level):
		"0":
			get_node("GearLevelNumber").set("custom_colors/font_color", Color("cececece"))
			get_node("GearLevelText").set("custom_colors/font_color", Color("cececece"))
		"1":
			get_node("GearLevelNumber").set("custom_colors/font_color", Color("0ac122"))
			get_node("GearLevelText").set("custom_colors/font_color", Color("0ac122"))
		"2":
			get_node("GearLevelNumber").set("custom_colors/font_color", Color("0d63d2"))
			get_node("GearLevelText").set("custom_colors/font_color", Color("0d63d2"))
		"3":
			get_node("GearLevelNumber").set("custom_colors/font_color", Color("790dd2"))
			get_node("GearLevelText").set("custom_colors/font_color", Color("790dd2"))
		"4":
			get_node("GearLevelNumber").set("custom_colors/font_color", Color("ebdd0f"))
			get_node("GearLevelText").set("custom_colors/font_color", Color("ebdd0f"))
#	$GearLevelBar.value = new_value
#	get_node("GearLevelBar").value = item_level % 10
