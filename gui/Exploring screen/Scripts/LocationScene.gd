extends Panel

var selected_location = "forest"

func _ready():
	$BackButton.connect("pressed", self, "on_back_pressed")
	generate_enemies()
	$EnemyInfo/Name.text = "Name"
	$EnemyInfo/Level.text =  "Level"
#	$EnemyInfo/Icon.texture = null
	$EnemyInfo/Attack.visible = false
	$EnemyInfo/Attack.connect("pressed", self, "on_attack_pressed")

func on_back_pressed():
	SceneTransition.change_scene("res://gui/Exploring screen/Scenes/ExploringScene.tscn")

var clicked = 0
func on_enemy_pressed(enemy):
	for ch in $map_bg/ScrollContainer/map.get_children():
		ch.get_node("bg").modulate = Color(1,1,1,0)
	
	clicked += 1
	$EnemyInfo/Attack.visible = true
	$EnemyInfo/Name.text = enemy.name
	$EnemyInfo/Level.text = str(tr("LEVEL"), " ", enemy.level)
	$EnemyInfo/Icon.self_modulate = enemy.shade
	if clicked > 1 and Fighting.enemy.unique_id == enemy.unique_id:
		Fighting.enemy = enemy
		SceneTransition.change_scene("res://gui/Fight screen/FightScene.tscn")
		clicked = 0
		return
	Fighting.enemy = enemy

func on_attack_pressed():
	clicked = 0
	SceneTransition.change_scene("res://gui/Fight screen/FightScene.tscn")

func generate_enemies():
	var enemy_amount = ItemGenerator.rng.randi_range(4, 7)
	var positions = []
	for i in enemy_amount:
		var enemy = ResourceManager.NODES.ENEMY.instance()
		var enemy_rand = ItemGenerator.rng.randi_range(0, LocationData.locations[selected_location].enemies.size()-1)
		enemy.setup_enemy(LocationData.locations[selected_location].enemies[enemy_rand])
		enemy.connect("pressed", self, "on_enemy_pressed")
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
