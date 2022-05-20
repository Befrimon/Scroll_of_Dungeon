extends Control


func _ready():
	var sett_data = Const.LANGUAGE["settings"]
	$BackgroundItems/Title.text = sett_data["title"]
	for lab in sett_data["labels"]:
		var node = self.find_node(lab+"Edit").find_node("Label")
		node.text = sett_data["labels"][lab]
	$MusicEdit/Slider.value = Const.PARAMETERS["music"]
	$SoundEdit/Slider.value = Const.PARAMETERS["volume"]


func _on_Music_changed():
	$MusicEdit/Value.text = str(int($MusicEdit/Slider.value))
func _on_Sound_changed():
	$SoundEdit/Value.text = str(int($SoundEdit/Slider.value))
