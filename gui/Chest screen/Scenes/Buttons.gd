extends Panel


func _ready():
	$Equipment.connect("pressed", self, "toggle_button", [$Equipment])

func toggle_button(button):
	if button.pressed:
		get_parent().get_node("EquipmentScene").show()
		var bg = button.get_node("Background")
		#makes bg darker
		bg.set("custom_styles/panel", load("res://assets/StyleBoxes/button_background_pressed.tres"))
		#shifts icon down
		button.rect_position += Vector2(2, 2)
		bg.rect_position -= Vector2(2, 2)
	else:
		get_parent().get_node("EquipmentScene").hide()
		var bg = button.get_node("Background")
		#makes bg lighter
		bg.set("custom_styles/panel", load("res://assets/StyleBoxes/button_background_normal.tres"))
		#shifts icon back up
		button.rect_position -= Vector2(2, 2)
		bg.rect_position += Vector2(2, 2)
