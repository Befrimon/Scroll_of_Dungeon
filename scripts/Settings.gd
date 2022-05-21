extends Control


func _ready():
	var sett_data = Const.LANGUAGE["settings"]
	$BackgroundItems/Title.text = sett_data["title"]
	for lab in sett_data["labels"]:
		var node = self.find_node(lab+"Edit").find_node("Label")
		node.text = sett_data["labels"][lab]
	$MusicEdit/Slider.value = Const.PARAMETERS["music"]
	$SoundEdit/Slider.value = Const.PARAMETERS["volume"]
	
	var button = load("res://sprites/Button.tscn").instance()
	button.generate("menu", sett_data["buttons"]["back"], [512, 500], [210, 30])
	button.connect("pressed", self, "to_menu")
	self.add_child(button)


func to_menu():
	get_tree().change_scene("res://scenes/Menu.tscn")
	
func _on_Music_changed(value):
	$MusicEdit/Value.text = str(value)
	Const.PARAMETERS["music"] = value
	Functions.write_json("res://data/parameters.json", Const.PARAMETERS)
func _on_Sound_changed(value):
	$SoundEdit/Value.text = str(value)
	Const.PARAMETERS["volume"] = value
	Functions.write_json("res://data/parameters.json", Const.PARAMETERS)

func _on_item_selected(index):
	Const.SELECT_LANG = index
	Const.PARAMETERS["language"] = Const.SHORT_LANG[index]
	Const.LANGUAGE = Functions.read_json("res://languages/"+Const.PARAMETERS["language"]+".json")
	Functions.write_json("res://data/parameters.json", Const.PARAMETERS)
	get_tree().reload_current_scene()
