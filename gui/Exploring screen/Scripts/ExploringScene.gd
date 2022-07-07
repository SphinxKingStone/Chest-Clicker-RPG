extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$BackButton.connect("pressed", self, "on_back_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_back_pressed():
	get_tree().change_scene("res://gui/Chest screen/Scenes/MainScene.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://gui/Exploring screen/Scenes/LocationScene.tscn")
