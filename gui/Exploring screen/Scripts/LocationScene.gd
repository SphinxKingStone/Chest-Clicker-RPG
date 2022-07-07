extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy_texture = $map_bg/ScrollContainer/map/Control/AnimatedSprite.frames.get_frame("idle", 0)
	print_debug(enemy_texture.get_size()  * $map_bg/ScrollContainer/map/Control/AnimatedSprite.scale)
	$map_bg/ScrollContainer/map/Control/AnimatedSprite.position += enemy_texture.get_size() * $map_bg/ScrollContainer/map/Control/AnimatedSprite.scale / 2
	$map_bg/ScrollContainer/map/Control/ColorRect.connect("gui_input", self, "enem_input")
	$BackButton.connect("pressed", self, "on_back_pressed")

func on_back_pressed():
	get_tree().change_scene("res://gui/Exploring screen/Scenes/ExploringScene.tscn")

func enem_input(event):
	if event is InputEventScreenTouch and !event.is_pressed():
		get_tree().change_scene("res://gui/Fight screen/FightScene.tscn")
		
