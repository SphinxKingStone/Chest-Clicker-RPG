extends Control


func _ready():
	$PlayButton.connect("pressed", self, "on_button_pressed", [$PlayButton])
	$OptionsButton.connect("pressed", self, "on_button_pressed", [$OptionsButton])
	$ContactButton.connect("pressed", self, "on_button_pressed", [$ContactButton])


func on_button_pressed(button):
	match button.name:
		"PlayButton":
			SceneTransition.change_scene("res://gui/Chest screen/Scenes/MainScene.tscn")
		"OptionsButton":
			print_debug("Options")
		"ContactButton":
			print_debug("ContactButton")
