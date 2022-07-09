extends Node

var player
var enemy

func _ready():
	pass

func initiate_fight(player, enemy):
	
	self.player = {"stats": player.stats} # making a copy of player but taking only stats for now
	self.enemy = enemy.duplicate(true)

func calculate_attack(entity):
	var stats = entity.stats
	var damage = stats["damage"]
	var bonus_dmg_to_crit = 1.5
	bonus_dmg_to_crit += (stats["strength"] / 8) / 100
	var bonus_dmg = stats["strength"] / 10
	damage += ItemGenerator.rng.randf_range(-0.1, 0.1) * damage # some rng for attack value
	
	var crit_dmg = 0
	if ItemGenerator.rng.randi_range(1, 100) < stats["critical"]:
		crit_dmg = damage * bonus_dmg_to_crit
		damage = crit_dmg
		print_debug("crit")
	
	damage += bonus_dmg
	
	return stepify(damage, 0.1)

func calculate_damage_taken(entity, recieving_damage):
	var stats = entity.stats
	var defense_negate = recieving_damage * stats["defense"] / 1000.0
	defense_negate += ItemGenerator.rng.randf_range(-0.15, 0.15) * defense_negate # some rng for attack value
	var damage_taken = recieving_damage
	damage_taken -= defense_negate
	
	if ItemGenerator.rng.randi_range(1, 100) < stats.dodge:
		damage_taken = 0
		print_debug("dodged")
	elif ItemGenerator.rng.randi_range(1, 100) < stats.block:
		damage_taken -= damage_taken * (0.2 + (stats.endurance / 10) / 100) 
		print_debug("blocked")
		# it was blocked
	
	if damage_taken < 0:
		damage_taken = 0
	
	return stepify(damage_taken, 0.1)

func attack(attacking, receiving, attack_type):
	var calc_attack = calculate_attack(attacking)
	var calc_dmg_taken = calculate_damage_taken(receiving, calc_attack)
	print_debug(calc_dmg_taken)
	receiving.stats.life -= calc_dmg_taken
	if receiving.stats.life < 0:
		receiving.stats.life = 0
		print_debug("dead")


func get_hp(entity):
	if entity == "character":
		return stepify(player.stats.life, 1.0)
	if entity == "enemy":
		return stepify(enemy.stats.life, 1.0)
