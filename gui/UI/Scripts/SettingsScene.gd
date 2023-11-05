extends Control


func _ready():
	$VBoxContainer/MusicSlider.connect("drag_ended", self, "slider_change", [$VBoxContainer/MusicSlider, "music"])
	$VBoxContainer/EffectsSlider.connect("drag_ended", self, "slider_change", [$VBoxContainer/EffectsSlider, "effects"])
	$VBoxContainer/CreakSlider.connect("drag_ended", self, "slider_change", [$VBoxContainer/CreakSlider, "creak"])
	$BackButton.connect("pressed", self, "exit_pressed")

func slider_change(value_changed, slider, type):
	var volume = slider.value - 50 # 50 = middle = 0 change
	match type:
		"music":
			Settings.set_music_volume(volume)
			Audio.update_music_volume(Settings.music_volume)
		"effects":
			Settings.set_sounds_volume(volume)
		"creak":
			Settings.set_creak_volume(volume)

func exit_pressed():
	hide()
