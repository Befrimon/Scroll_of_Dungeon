extends Button

var image_path = ""


func generate(path, content, pos, size):
	self.rect_position = Vector2(pos[0]-size[0]/2, pos[1]-size[1]/2)
	self.rect_size = Vector2(size[0], size[1])
	$TextLab.text = content
	$TextLab.rect_size = Vector2(size[0], size[1])
	$image.position = Vector2(size[0]/2, size[1]/2)
	$image.scale = Vector2(size[0]/180, size[1]/30)
	$image.texture = load("res://images/buttons/"+path+"/static.png")
	image_path = path

func _on_Button_mouse_entered(): $image.texture = load("res://images/buttons/"+image_path+"/flow.png")
func _on_Button_mouse_exited(): $image.texture = load("res://images/buttons/"+image_path+"/static.png")
