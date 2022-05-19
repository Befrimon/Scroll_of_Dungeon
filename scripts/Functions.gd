extends Node


func _ready():
	Const.PARAMETERS = read_json("res://data/parameters.json")
	Const.LANGUAGE = read_json("res://languages/"+Const.PARAMETERS["language"]+".json")


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
