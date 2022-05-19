extends AnimatedSprite

var is_anim = false
var do_anim = false


func _input(event):
	if event is InputEventMouseButton:
		var btn_pos = self.position
		var size = [148, 74]
		var cur_pos = event.position
		if btn_pos[0]-size[0]/2 <= cur_pos[0] and cur_pos[0] <= btn_pos[0]+size[0]/2 and \
		   btn_pos[1]-size[1]/2 <= cur_pos[1] and cur_pos[1] <= btn_pos[1]+size[1]/2:
			is_anim = true

func scale_anim(delta):
	self.rotation_degrees -= delta*90
	self.scale.x += delta*3.5
	self.scale.y += delta*3.5

func _process(delta):
	if not is_anim: return
	if int(self.rotation_degrees) != 0 and int(self.scale.x) != 4:
		self.scale_anim(delta)
		return
	if not do_anim: 
		self.play("Open")
		self.get_parent().show_timeout = 0.82
	do_anim = true
