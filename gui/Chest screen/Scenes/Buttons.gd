extends Panel


func _ready():
	$Equipment.connect("pressed", self, "toggle_button")

func toggle_button(button):
	if button.pressed:
		button.get_child("Background").set("custom_styles/panel", load("res://assets/StyleBoxes/button_background_pressed.tres"))
	else:
		button.get_child("Background").set("custom_styles/panel", load("res://assets/StyleBoxes/button_background_normal.tres"))
