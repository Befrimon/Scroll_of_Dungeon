extends Node2D


func _ready():
	var button = load("res://sprites/Button.tscn").instance()
	button.generate("menu", "TRY AGAIN", [512, 500], [210, 30])
	button.connect("pressed", self, "try_again")
	self.add_child(button)
	
	
func try_again():
	Const.lamp_count = 1
	get_tree().change_scene("res://scenes/Game.tscn")
