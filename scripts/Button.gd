extends Button

var image_path = ""


func generate(path, content, pos, size):
	self.rect_position.x = pos[0] - size[0]/2
	self.rect_position.y = pos[1] - size[1]/2
	self.rect_size.x = size[0]
	self.rect_size.y = size[1]
	
	$TextLab.text = content
	$TextLab.rect_size.x = size[0]
	$TextLab.rect_size.y = size[1]
	
	$image.position.x = size[0]/2
	$image.position.y = size[1]/2
	$image.scale.x = 2.25
	$image.scale.y = 2.25
	$image.texture = load("res://images/buttons/"+path+"/static.png")
	
	image_path = path


func _mouse_entered():
	$image.texture = load("res://images/buttons/"+image_path+"flow.png")


func _input(event):
	if event is InputEventMouseMotion:
		var btn_pos = self.rect_position
		var size = self.rect_size
		var cur_pos = event.position
		if btn_pos[0] <= cur_pos[0] and cur_pos[0] <= btn_pos[0]+size[0] and \
		   btn_pos[1] <= cur_pos[1] and cur_pos[1] <= btn_pos[1]+size[1]:
			$image.texture = load("res://images/buttons/"+image_path+"/flow.png")
		else:
			$image.texture = load("res://images/buttons/"+image_path+"/static.png")
