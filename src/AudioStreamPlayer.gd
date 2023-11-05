extends AudioStreamPlayer

var prev_music = ""

func _init():
	self.connect("finished", self, "play_random_music")

func play_music(music):
	self.set_stream(music)
	update_music_volume(Settings.music_volume)
	self.play()

func update_music_volume(volume):
	self.set_volume_db(Settings.music_volume)

func play_random_music():
	var selection = "BACKGROUND"+ str(ItemGenerator.rng.randi_range(1, 4))
	while selection == prev_music:
		selection = "BACKGROUND"+ str(ItemGenerator.rng.randi_range(1, 4))
	play_music(ResourceManager.MUSIC[selection])
	prev_music = selection

func play_sound(sound, delay = 0, volume_adj = 0):
	if delay > 0:
		yield(get_tree().create_timer(delay), "timeout")
	
	var player = AudioStreamPlayer.new()
	player.autoplay = false
	player.set_stream(sound)
	player.set_volume_db(Settings.sounds_volume + volume_adj)
	player.play()
	add_child(player)
	
	yield(player, "finished")
	remove_child(player)
	player.queue_free()

func play_creak_sound():
	var player = AudioStreamPlayer.new()
	player.autoplay = false
	var creak = load("res://assets/Sounds/Sounds/creak1.wav")
	player.set_stream(creak)
	player.set_volume_db(Settings.creak_volume)
	player.play()
	add_child(player)
	
	yield(player, "finished")
	remove_child(player)
	player.queue_free()
