extends Control


func _ready():
	OS.window_size = Vector2(360*1.5, 640*1.5) # this
	OS.window_position.y = 100 # and this goes into main menu scene
	
