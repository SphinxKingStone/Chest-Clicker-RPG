extends AudioStreamPlayer

func _ready():
	var music: AudioStreamOGGVorbis = preload("res://assets/Sounds/Music/bg1.ogg")
	play_music(music)

func play_music(music):
	set_stream(music)
	set_volume_db(-20)
	play()

func play_sound(sound, delay = 0):
	if delay > 0:
		yield(get_tree().create_timer(delay), "timeout")
	
	var player = AudioStreamPlayer.new()
	player.autoplay = false
	player.set_stream(sound)
	player.set_volume_db(-10)
	player.play()
	add_child(player)
	
	yield(player, "finished")
	remove_child(player)
