extends Node

var save_files = ["user://inventory.save", "user://equipment.save", "user://progress.save", "user://achievements.save"]
const autosave_timer = 10

func _init():
#	load_game()
	pass

func _ready():
	# timer that autosaves game
	load_game()
	var timer = Timer.new()
	timer.set_wait_time(autosave_timer)
	timer.connect("timeout", self, "save_game")
	timer.set_autostart(true)
	self.add_child(timer)

func save_game():
	for file in save_files:
		# open file
		var save_game_file = File.new()
		save_game_file.open(file, File.WRITE)
		
		# save stuff
		match file:
			# save inventory
			"user://inventory.save":
				for item in Character.get_inventory():
					save_game_file.store_var(item, true)
			
			# save equipment
			"user://equipment.save":
				save_game_file.store_var(Character.get_equipment(), true)
			
			# save global progress
			"user://progress.save":
				save_game_file.store_var(ItemGenerator.generated_items_amount)
				save_game_file.store_var(Character.Inventory.silver)
			
			# save achievements progress
			"user://achievements.save":
				save_game_file.store_var(Achievements.completed_achievements)
		
		# close file
		save_game_file.close()

func load_game():
	for file in save_files:
		# open file
		var save_game_file = File.new()
		if not save_game_file.file_exists(file):
			return # Error! We don't have a save to load.
		save_game_file.open(file, File.READ)
		
		# load stuff
		match file:
			# load inventory
			"user://inventory.save":
				while save_game_file.get_position() < save_game_file.get_len():
					var item = save_game_file.get_var(true)
					Character.add_item(item)
			
			# load equipment
			"user://equipment.save":
				Character.set_equipment(save_game_file.get_var(true))
			
			# load global progress
			"user://progress.save":
				ItemGenerator.generated_items_amount = save_game_file.get_var()
				Character.Inventory.silver = save_game_file.get_var()
			
			# load achievement progress
			"user://achievements.save":
				Achievements.completed_achievements = save_game_file.get_var()
		
		# close file
		save_game_file.close()

# deletes all saved data
func clear_save():
	var dir = Directory.new()
	for file in save_files:
		dir.remove(file)
