extends AudioStreamPlayer

var prev_music = ""
var prev_creak_pitch = 1.0
var prev_creak = ""

func _init():
	self.connect("finished", self, "play_random_music")

func play_music(music):
	self.set_stream(music)
	update_music_volume(Settings.music_volume)
	self.play()

func update_music_volume(volume):
	self.set_volume_db(Settings.music_volume)

func play_random_music():
	var music_track_count = 3
	var selection = "BACKGROUND"+ str(ItemGenerator.rng.randi_range(1, music_track_count))
	while selection == prev_music:
		selection = "BACKGROUND"+ str(ItemGenerator.rng.randi_range(1, music_track_count))
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
	var creak_track_count = 3
	var player = AudioStreamPlayer.new()
	player.autoplay = false
	var selection = "CREAK"+ str(ItemGenerator.rng.randi_range(1, creak_track_count))
	while selection == prev_creak:
		selection = "CREAK"+ str(ItemGenerator.rng.randi_range(1, creak_track_count))
	player.set_stream(ResourceManager.SOUNDS[selection])
	
	var rand_pitch = ItemGenerator.rng.randf_range(0.75, 1.2)
	while abs(rand_pitch - prev_creak_pitch) < 0.05:
		 rand_pitch = ItemGenerator.rng.randf_range(0.75, 1.2)
	player.pitch_scale = rand_pitch
	prev_creak_pitch = rand_pitch
	prev_creak = selection
	
	player.set_volume_db(Settings.creak_volume)
	player.play()
	add_child(player)
	
	yield(player, "finished")
	remove_child(player)
	player.queue_free()
