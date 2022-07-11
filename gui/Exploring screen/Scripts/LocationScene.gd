extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$BackButton.connect("pressed", self, "on_back_pressed")
	generate_enemies()

func on_back_pressed():
	SceneTransition.change_scene("res://gui/Exploring screen/Scenes/ExploringScene.tscn")

func generate_enemies():
	var enemy_amount = 6
	var positions = []
	for i in enemy_amount:
		var enemy = ResourceManager.NODES.ENEMY.instance()
		$map_bg/ScrollContainer/map.add_child(enemy)
		
		# randomize enemy position
		var enemy_position = Vector2(0,0)
		enemy_position.x = ItemGenerator.rng.randi_range(0, $map_bg/ScrollContainer/map.rect_size.x - enemy.rect_size.x)
		enemy_position.y = ItemGenerator.rng.randi_range(0, $map_bg/ScrollContainer/map.rect_size.y - enemy.rect_size.y)
		
		# checks for collisions in enemy spawn
		var has_collisions = true
		while has_collisions:
			has_collisions = false
			for pos in positions:
				while abs(enemy_position.x - pos.x) < enemy.rect_size.x and abs(enemy_position.y - pos.y) < enemy.rect_size.y:
					has_collisions = true
					enemy_position.x = ItemGenerator.rng.randi_range(0, $map_bg/ScrollContainer/map.rect_size.x - enemy.rect_size.x)
					enemy_position.y = ItemGenerator.rng.randi_range(0, $map_bg/ScrollContainer/map.rect_size.y - enemy.rect_size.y)
		positions.append(enemy_position)
		
		# applying enemy pos
		enemy.rect_position = enemy_position
