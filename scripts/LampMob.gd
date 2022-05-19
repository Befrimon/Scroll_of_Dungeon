extends KinematicBody2D

var bite = false
var time = 0
var speed = 250


func _process(delta):
	if $AttackArea.overlaps_body(get_parent().player) and time == 0:
		time = 0
		bite = true
	
	if bite: self.bite_event(delta)
	else:
		var d = self.get_coef()
		if d[0] > 0: 
			$Texture.flip_h = true
			$Hitbox1.disabled = true
			$Hitbox2.disabled = false
			$AttackArea.position.y = -20.5
			$BiteArea.position.y = -28.5
			$Light2D.position.x = 25
		if d[0] < 0: 
			$Texture.flip_h = false
			$Hitbox1.disabled = false
			$Hitbox2.disabled = true
			$AttackArea.position.y = 23.5
			$BiteArea.position.y = 31.5
			$Light2D.position.x = -27
		self.move_and_collide(Vector2(speed*d[0]*delta, speed*d[1]*delta))
		$Texture.play("walk")


func get_coef():
	var delta_x = get_parent().player.position.x - self.position.x
	var delta_y = get_parent().player.position.y - self.position.y
	return [delta_x/abs(delta_x), delta_y/abs(delta_y)]


func bite_event(delta):
	time += delta
	if time <= 0.5: $Texture.play("bite")
	elif time <= 1: 
		$Texture.play("unbite")
		if $BiteArea.overlaps_body(get_parent().player):
			Const.player_data["hits"] -= 60*delta*2
	elif time > 1: 
		time = 0 
		bite = false


