extends Panel


func _ready():
	pass

# this scene goes down by self.rect_size.y + 15 pixels and vanishes after 5 seconds
func appear():
	var tween = get_node("Tween")
	var new_pos = self.rect_position + Vector2(0, self.rect_size.y + 15)
	tween.interpolate_property(self, "rect_position",
			self.rect_position, new_pos, 0.5,
			Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.start()
	
	yield(get_tree().create_timer(5), "timeout")
	disappear()

func disappear():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "modulate",
			Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1,
			Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.start()
	yield(tween, "tween_all_completed")
	self.queue_free()


func _on_Button_pressed():
	self.queue_free()
