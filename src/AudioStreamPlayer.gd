extends AudioStreamPlayer

var prev_music = ""
var music_volume = -20
var sounds_volume = -10

func _ready():
	self.connect("finished", self, "play_random_music")
	pass

func play_music(music):
	self.set_stream(music)
	self.set_volume_db(music_volume)
	self.play()

func play_random_music():
	var selection = "BACKGROUND"+ str(ItemGenerator.rng.randi_range(1, 4))
	while selection == prev_music:
		selection = "BACKGROUND"+ str(ItemGenerator.rng.randi_range(1, 4))
	play_music(ResourceManager.MUSIC[selection])
	prev_music = selection

func play_sound(sound, delay = 0):
	if delay > 0:
		yield(get_tree().create_timer(delay), "timeout")
	
	var player = AudioStreamPlayer.new()
	player.autoplay = false
	player.set_stream(sound)
	player.set_volume_db(sounds_volume)
	player.play()
	add_child(player)
	
	yield(player, "finished")
	remove_child(player)
