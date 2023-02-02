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
		emit_signal("pressed", enemy)
		$bg.modulate = Color(1,1,1,0.15)

func setup_enemy(code):
	enemy = EnemyData.enemies[code].duplicate()
	enemy.unique_id = randi()
	
	$AnimatedSprite.frames = enemy.frames
	$AnimatedSprite.scale = enemy.sprite_properties.idle.location_scale
	$AnimatedSprite.self_modulate = enemy.shade
	
	$AnimatedSprite.position = Vector2(0, 0)
	var enemy_texture = $AnimatedSprite.frames.get_frame("idle", 0)
	$AnimatedSprite.position += enemy_texture.get_size() * $AnimatedSprite.scale / 2
	
	$bg.connect("gui_input", self, "enemy_input")
	self.rect_size = $bg.rect_size
