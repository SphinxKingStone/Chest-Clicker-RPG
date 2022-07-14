extends Panel

var current_gear_level = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Character.connect("item_equipped", self, "update_bar")

func update_bar():
	$GearLevelText.material = null
	$GearLevelBar.material = null
	var item_level = 0
	var new_gear_level = 0
	for item in Character.get_equipment().values():
		if item != null:
			item_level += ItemsData.ITEM_LEVEL[item.rarity]
			if item.category == "two_handed":
				item_level += ItemsData.ITEM_LEVEL[item.rarity]
	new_gear_level = floor(item_level/10)
	
	var old_value = get_node("GearLevelBar").value
	var new_value = (item_level % 10) * 100
	$Tween.start()
	var anim_speed = 0.25
	if new_gear_level > current_gear_level:
		$Tween.interpolate_property($GearLevelBar, "value", old_value, 1000, anim_speed * ((1000 - old_value) / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		# stupid fix but meh it's 7 AM
		if new_gear_level != 6:
			$Tween.interpolate_property($GearLevelBar, "value", 0, new_value, anim_speed * (new_value / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
	elif new_gear_level < current_gear_level:
		$Tween.interpolate_property($GearLevelBar, "value", old_value, 0, anim_speed * (old_value / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
		yield($Tween, "tween_completed")
		$Tween.interpolate_property($GearLevelBar, "value", 1000, new_value, anim_speed * ((1000 - new_value) / 100), Tween.TRANS_CUBIC, Tween.EASE_OUT)
	else:
		if old_value > new_value: # decresing
			$Tween.interpolate_property($GearLevelBar, "value", old_value, new_value,  anim_speed * ((old_value - new_value) / 100 ), Tween.TRANS_CUBIC, Tween.EASE_OUT)
		else: # increasing
			$Tween.interpolate_property($GearLevelBar, "value", old_value, new_value,  anim_speed * ((new_value - old_value) / 100 ), Tween.TRANS_CUBIC, Tween.EASE_OUT)
	
	$GearLevelText.text = "Gear Level:" + " " + str(new_gear_level)
	if new_gear_level == 6:
		$GearLevelText.material = load("res://assets/Shaders/RainbowEffect.tres")
		$GearLevelBar.material = load("res://assets/Shaders/RainbowEffect.tres")
		$GearLevelBar.value = 1000
	else:
		$GearLevelText.set("custom_colors/font_color", ResourceManager.rarity_color[int(new_gear_level)])
		
	current_gear_level = new_gear_level
