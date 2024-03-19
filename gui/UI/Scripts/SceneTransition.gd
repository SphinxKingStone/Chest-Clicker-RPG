extends CanvasLayer

var current_scene = null

func change_scene(target):
	$AnimationPlayer.play("dissolve")
	yield($AnimationPlayer, "animation_finished")
	
#	if current_scene != null:
#		current_scene.queue_free()
#		remove_child(current_scene)
#
#	if typeof(target) == TYPE_STRING:
#		var scene = load(target)
#		var instance = scene.instance()
#		current_scene = instance
#		add_child(current_scene)
#	else:
#		pass
	
	get_tree().change_scene(target)
#	get_tree().call_deferred("add_child", target)
	
	$AnimationPlayer.play_backwards("dissolve")
