extends Control


func _init():
	OS.window_size = Vector2(360*1.5, 640*1.5) # this
	OS.window_position.y = 100 # and this goes into main menu scene
	TranslationServer.set_locale("en")
	Audio.play_random_music()

func _input(event):
	if event is InputEventScreenTouch:
		if !event.is_pressed():
			ResourceManager.clear_item_info_children()
			if !$InventoryScene/Menu/HBox/Info.pressed:
				$InventoryScene/Menu.hide()
