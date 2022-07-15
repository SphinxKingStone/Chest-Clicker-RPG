extends Node

func _ready():
	for a in AchievementsData.achievements.values():
		add_achievement(a)

func _on_BackButton_pressed():
	SceneTransition.change_scene("res://gui/Chest screen/Scenes/MainScene.tscn")

func add_achievement(data):
	var panel = $ScrollContainer/VBoxContainer/Achievement.duplicate()
	panel.visible = true
	$ScrollContainer/VBoxContainer.add_child(panel)
	
	panel.get_node("Name").text = data.name
	panel.get_node("Description").text = data.description
	disable_panel(panel)
	for completed in Achievements.completed_achievements:
		if completed.name == data.name:
			enable_panel(panel)
			break

func disable_panel(panel):
	panel.modulate.r = 0.4
	panel.modulate.g = 0.4
	panel.modulate.b = 0.4
	panel.set("custom_styles/panel", null)

func enable_panel(panel):
	panel.modulate.r = 1.0
	panel.modulate.g = 1.0
	panel.modulate.b = 1.0
	panel.set("custom_styles/panel", load("res://assets/StyleBoxes/AchievementEnabled.tres"))
