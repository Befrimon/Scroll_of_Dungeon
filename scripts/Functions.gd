extends Node


func _ready():
	var lang_id = 0
	Const.PARAMETERS = read_json("res://data/parameters.json")
	Const.LANGUAGE = read_json("res://languages/"+Const.PARAMETERS["language"]+".json")
	for file in open_dir("res://languages")["files"]:
		if file.substr(0, 3) == Const.PARAMETERS["language"]: Const.SELECT_LANG = lang_id
		lang_id += 1
		var lang = read_json("res://languages/"+file)
		Const.LANG_LIST.append(lang["title"])


func open_dir(path):
	var dir = Directory.new()
	var res = {
		"dirs": [],
		"files": []
	}
	dir.open(path)
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir(): res["dirs"].append(file_name)
		else: res["files"].append(file_name)
		file_name = dir.get_next()
	return res


func _process(delta):
	if Const.player_data["hits"] <= 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")


func read_json(path):  
	var file = File.new()  
	file.open(path, File.READ)  
	var text = file.get_as_text()  
	var data = parse_json(text) 
	file.close()  
	return data   
