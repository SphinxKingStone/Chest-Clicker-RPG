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
	var anim_speed = 0.25
	if gear_level > old_gear_level:
		$Tween.interpolate_property($GearLevelBar, "value", old_value, 1000, anim_speed * ((1000 - old_value) / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		$Tween.interpolate_property($GearLevelBar, "value", 0, new_value, anim_speed * (new_value / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
	elif gear_level < old_gear_level:
		$Tween.interpolate_property($GearLevelBar, "value", old_value, 0, anim_speed * (old_value / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		$Tween.interpolate_property($GearLevelBar, "value", 1000, new_value, anim_speed * ((1000 - new_value) / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
	else:
		if old_value > new_value: # decresing
			$Tween.interpolate_property($GearLevelBar, "value", old_value, new_value,  anim_speed * ((old_value - new_value) / 100 ), Tween.TRANS_CUBIC, Tween.EASE_OUT)
		else: # increasing
			$Tween.interpolate_property($GearLevelBar, "value", old_value, new_value,  anim_speed * ((new_value - old_value) / 100 ), Tween.TRANS_CUBIC, Tween.EASE_OUT)
	
	get_node("GearLevelNumber").text = str(gear_level)
	get_node("GearLevelNumber").set("custom_colors/font_color", ResourceManager.rarity_color[int(gear_level)])
	get_node("GearLevelText").set("custom_colors/font_color", ResourceManager.rarity_color[int(gear_level)])
#	$GearLevelBar.value = new_value
#	get_node("GearLevelBar").value = item_level % 10
