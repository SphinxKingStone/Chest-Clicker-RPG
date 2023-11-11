extends Control


func _ready():
	$VBoxContainer/MusicSlider.connect("value_changed", self, "slider_change", [$VBoxContainer/MusicSlider, "music"])
	$VBoxContainer/EffectsSlider.connect("value_changed", self, "slider_change", [$VBoxContainer/EffectsSlider, "effects"])
	$VBoxContainer/CreakSlider.connect("value_changed", self, "slider_change", [$VBoxContainer/CreakSlider, "creak"])
	$BackButton.connect("pressed", self, "exit_pressed")

func slider_change(value_changed, slider, type):
	var volume = slider.value - 20
	
	# if volume slider set to minimum then mute aka make it -100
	if volume <= -20:
		volume = -100
	match type:
		"music":
			Settings.set_music_volume(volume)
			Audio.update_music_volume(Settings.music_volume)
		"effects":
			Settings.set_sounds_volume(volume)
		"creak":
			Settings.set_creak_volume(volume)
	Audio.play_sound(preload("res://assets/Sounds/Sounds/UI/Slider_v3_wav.wav"), 0, -5)

func exit_pressed():
	hide()
