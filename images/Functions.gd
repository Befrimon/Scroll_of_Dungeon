extends Node


func _ready():
	var parameters = 



func read_json(path):  
	var file = File.new()  
	file.open(path, File.Read)  
	var text = file.get_as_text()  
	var data = parse_json(text) 
	file.close()  
	return data   
