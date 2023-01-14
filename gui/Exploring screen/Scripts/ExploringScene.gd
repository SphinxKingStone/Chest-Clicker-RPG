extends Control


func _ready():
	$BackButton.connect("pressed", self, "on_back_pressed")
	for loc in $ScrollContainer/VBoxContainer.get_children():
		var bt = loc.get_node("VisitButton")
		bt.connect("pressed", self, "on_visit_button_pressed", [loc.name])
#	var tw = Tween.new()
#	add_child(tw) 
#	tw.start()
#	for c in get_children():
#		if c.name == "Background":
#			continue
#		tw.interpolate_property(c, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.15, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

func on_visit_button_pressed(location):
	match location:
		"Forest":
#			LocationScene.generate_enemies()
			SceneTransition.change_scene("res://gui/Exploring screen/Scenes/LocationScene.tscn")

func on_back_pressed():
	SceneTransition.change_scene("res://gui/Chest screen/Scenes/MainScene.tscn")
