extends Control

var scroll = load("res://sprites/Scroll.tscn").instance()
var show_timeout = 0


func _ready():
	scroll.position.x = 512
	scroll.position.y = 300
	self.add_child(scroll)


func show_ui():
	self.move_child($Label, 3)
	var menu_data = Const.LANGUAGE["menu"]
	var y_pos = 235
	for btn in menu_data["buttons"]:
		var button = load("res://sprites/Button.tscn").instance()
		button.generate("menu", menu_data["buttons"][btn], [512, y_pos], [210, 30])
		button.connect("pressed", self, "to_"+btn)
		self.add_child(button)
		y_pos += 65
		
		
func to_play():
	get_tree().change_scene("res://scenes/woodman_home.tscn")
func to_sett():
	get_tree().change_scene("res://scenes/Settings.tscn")
func to_exit():
	get_tree().quit()

func _process(delta):
	show_timeout -= delta
	if scroll.do_anim and -0.2 <= show_timeout and show_timeout <= 0: self.show_ui()
