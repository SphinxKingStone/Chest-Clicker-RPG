extends Control


func _ready():
	pass
#	var enemy_texture = $AnimatedSprite.frames.get_frame("idle", 0)
#	$AnimatedSprite.position += enemy_texture.get_size() * $AnimatedSprite.scale / 2
#	$ColorRect.connect("gui_input", self, "enemy_input")
#	self.rect_size = $ColorRect.rect_size

func enemy_input(event):
	if event is InputEventScreenTouch and !event.is_pressed():
		SceneTransition.change_scene("res://gui/Fight screen/FightScene.tscn")

func setup_enemy(code):
	$AnimatedSprite.frames = EnemyData.enemies[code].frames
	$AnimatedSprite.scale = EnemyData.enemies[code].sprite_properties.idle.location_scale
	
	$AnimatedSprite.position = Vector2(0, 0)
	var enemy_texture = $AnimatedSprite.frames.get_frame("idle", 0)
	$AnimatedSprite.position += enemy_texture.get_size() * $AnimatedSprite.scale / 2
	
	$ColorRect.connect("gui_input", self, "enemy_input")
	self.rect_size = $ColorRect.rect_size
