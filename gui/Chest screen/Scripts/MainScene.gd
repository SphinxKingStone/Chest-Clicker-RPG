extends Control

func _init():
	OS.window_size = Vector2(360*1.5, 640*1.5) # this
	OS.window_position.y = 100 # and this goes into main menu scene
	TranslationServer.set_locale(Settings.language)
	
	self.connect("tree_exiting", SaveManager, "save_game")

func _ready():
	$EquipmentScene.update_equipment()
	$TopSide/Silver/Amount.text = str(Character.Inventory.silver)
	Audio.play_random_music()

func _input(event):
	if event is InputEventScreenTouch:
		if !event.is_pressed():
			ResourceManager.clear_item_info_children()
			if !$InventoryScene/Menu/HBox/Info.pressed:
				$InventoryScene/Menu.hide()

func _on_clr_save_pressed():
	SaveManager.clear_save()
