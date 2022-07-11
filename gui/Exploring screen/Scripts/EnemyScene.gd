extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy_texture = $AnimatedSprite.frames.get_frame("idle", 0)
	$AnimatedSprite.position += enemy_texture.get_size() * $AnimatedSprite.scale / 2
	$ColorRect.connect("gui_input", self, "enemy_input")
	self.rect_size = $ColorRect.rect_size

func enemy_input(event):
	if event is InputEventScreenTouch and !event.is_pressed():
		SceneTransition.change_scene("res://gui/Fight screen/FightScene.tscn")
		
