extends Control

var save_files = ["user://inventory.save", "user://equipment.save"]
const autosave_timer = 30

func _init():
	OS.window_size = Vector2(360*1.5, 640*1.5) # this
	OS.window_position.y = 100 # and this goes into main menu scene
	TranslationServer.set_locale("en")
	Audio.play_random_music()
	clear_save()
	load_game()
	self.connect("tree_exiting", self, "save_game")

func _ready():
	$EquipmentScene.update_equipment()
	
	# timer that autosaves game
	var timer = Timer.new()
	timer.set_wait_time(autosave_timer)
	timer.connect("timeout", self, "save_game")
	timer.set_autostart(true)
	self.add_child(timer)

func _input(event):
	if event is InputEventScreenTouch:
		if !event.is_pressed():
			ResourceManager.clear_item_info_children()
			if !$InventoryScene/Menu/HBox/Info.pressed:
				$InventoryScene/Menu.hide()

func save_game():
	for file in save_files:
		# open file
		var save_game = File.new()
		save_game.open(file, File.WRITE)
		
		# save stuff
		match file:
			# save inventory
			"user://inventory.save":
				for item in Character.get_inventory():
					save_game.store_var(item, true)
			
			# save equipment
			"user://equipment.save":
				save_game.store_var(Character.get_equipment(), true)
		
		# close file
		save_game.close()

func load_game():
	for file in save_files:
		# open file
		var save_game = File.new()
		if not save_game.file_exists(file):
			return # Error! We don't have a save to load.
		save_game.open(file, File.READ)
		
		# load stuff
		match file:
			# load inventory
			"user://inventory.save":
				while save_game.get_position() < save_game.get_len():
					var item = save_game.get_var(true)
					Character.add_item(item)
			
			# load equipment
			"user://equipment.save":
				Character.set_equipment(save_game.get_var(true))
		
		# close file
		save_game.close()

# deletes all saved data
func clear_save():
	var dir = Directory.new()
	for file in save_files:
		dir.remove(file)
