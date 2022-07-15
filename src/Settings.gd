extends Node

var music_volume = -28
var sounds_volume = -10
var test_mode = true
#var test_mode = false
var language = "en"
#var language = "ru"



func _ready():
	if test_mode:
		music_volume = -100
		sounds_volume = -15
