extends Node

const music_basic_volume = -35
const sounds_basic_volume = -5
const creak_basic_volume = -7

var music_volume = 0
var sounds_volume = 0
var creak_volume = 0
#var test_mode = true
var language = "en"
#var language = "ru"



func _ready():
	music_volume = music_basic_volume
	sounds_volume = sounds_basic_volume

func set_music_volume(volume):
	music_volume = volume + music_basic_volume

func set_sounds_volume(volume):
	sounds_volume = volume + sounds_basic_volume

func set_creak_volume(volume):
	creak_volume = volume + creak_basic_volume
