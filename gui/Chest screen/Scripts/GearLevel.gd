extends Panel

var current_gear_level = 0

func _ready():
	Character.connect("item_equipped", self, "update_bar")

func update_bar(anim_speed = 0.25):
	$GearLevelText.material = null
	$GearLevelBar.material = null
	var item_level = Character.get_items_level()
	var new_gear_level = Character.get_gear_level()
	
	var old_value = get_node("GearLevelBar").value
	var new_value = (item_level % 10) * 100
	$Tween.start()
#	var anim_speed = 0.25
	if new_gear_level > current_gear_level:
		$Tween.interpolate_property($GearLevelBar, "value", old_value, 1000, anim_speed * ((1000 - old_value) / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		# stupid fix but meh it's 7 AM
		if new_gear_level != 6:
			$Tween.interpolate_property($GearLevelBar, "value", 0, new_value, anim_speed * (new_value / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
#	elif new_gear_level < current_gear_level:
#		$Tween.interpolate_property($GearLevelBar, "value", old_value, 0, anim_speed * (old_value / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
#		yield($Tween, "tween_completed")
#		$Tween.interpolate_property($GearLevelBar, "value", 1000, new_value, anim_speed * ((1000 - new_value) / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
	elif new_gear_level != 6:
#		if old_value > new_value: # decresing
#			$Tween.interpolate_property($GearLevelBar, "value", old_value, new_value,  anim_speed * ((old_value - new_value) / 100 ), Tween.TRANS_CUBIC, Tween.EASE_OUT)
#		else: # increasing
		$Tween.interpolate_property($GearLevelBar, "value", old_value, new_value,  anim_speed * ((new_value - old_value) / 100 ), Tween.TRANS_CUBIC, Tween.EASE_OUT)
	
	$GearLevelText.text = "Gear Level:" + " " + str(new_gear_level)
	if new_gear_level == 6:
		$GearLevelText.material = load("res://assets/Shaders/RainbowEffect.tres")
		$GearLevelBar.material = load("res://assets/Shaders/RainbowEffect.tres")
		$GearLevelBar.value = 1000
	else:
		$GearLevelText.set("custom_colors/font_color", ResourceManager.rarity_color[int(new_gear_level)])
		
	current_gear_level = new_gear_level
