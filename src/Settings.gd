extends Node

var music_volume = -30
var sounds_volume = -5
var test_mode = false
#var test_mode = true
var language = "en"
#var language = "ru"



func _ready():
	if test_mode:
		music_volume = -100
		sounds_volume = -100
