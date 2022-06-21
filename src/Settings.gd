extends Node

var music_volume = -20
var sounds_volume = -10
var test_mode = true
var language = "en"
#var language = "ru"



func _ready():
	if test_mode:
		music_volume = -100
