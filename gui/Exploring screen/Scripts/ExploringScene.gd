extends Control


func _ready():
	$BackButton.connect("pressed", self, "on_back_pressed")
	var tw = Tween.new()
	add_child(tw) 
	tw.start()
	for c in get_children():
		if c.name == "Background":
			continue
		tw.interpolate_property(c, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.15, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

func on_back_pressed():
	SceneTransition.change_scene("res://gui/Chest screen/Scenes/MainScene.tscn")

func _on_Button_pressed():
	SceneTransition.change_scene("res://gui/Exploring screen/Scenes/LocationScene.tscn")
