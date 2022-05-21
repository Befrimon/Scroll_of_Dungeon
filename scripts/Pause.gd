extends Control


func _ready():
	var button = load("res://sprites/Button.tscn").instance()
	button.pause_mode = Node.PAUSE_MODE_PROCESS
	button.generate("menu", "На хуй отсюда", [512, 400], [750, 30])
	button.connect("pressed", self, "close_pause")
	self.add_child(button)
	

func close_pause():
	get_tree().paused = false
	get_parent().remove_child(self)
