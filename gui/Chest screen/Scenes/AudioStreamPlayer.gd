extends AudioStreamPlayer


func _ready():
	var bg: AudioStreamOGGVorbis = preload("res://assets/Sounds/Music/bg1.ogg")
	set_stream(bg)
	set_volume_db(-20)
	play()
