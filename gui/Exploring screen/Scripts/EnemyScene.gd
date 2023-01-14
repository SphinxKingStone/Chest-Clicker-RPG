extends Control

var enemy = null

signal pressed

func _ready():
	pass
#	var enemy_texture = $AnimatedSprite.frames.get_frame("idle", 0)
#	$AnimatedSprite.position += enemy_texture.get_size() * $AnimatedSprite.scale / 2
#	$ColorRect.connect("gui_input", self, "enemy_input")
#	self.rect_size = $ColorRect.rect_size

func enemy_input(event):
	if event is InputEventScreenTouch and !event.is_pressed():
		emit_signal("pressed", self.enemy)

func setup_enemy(code):
	self.enemy = EnemyData.enemies[code]
	
	$AnimatedSprite.frames = self.enemy.frames
	$AnimatedSprite.scale = self.enemy.sprite_properties.idle.location_scale
	$AnimatedSprite.self_modulate = self.enemy.shade
	
	$AnimatedSprite.position = Vector2(0, 0)
	var enemy_texture = $AnimatedSprite.frames.get_frame("idle", 0)
	$AnimatedSprite.position += enemy_texture.get_size() * $AnimatedSprite.scale / 2
	
	$ColorRect.connect("gui_input", self, "enemy_input")
	self.rect_size = $ColorRect.rect_size
