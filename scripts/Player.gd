extends KinematicBody2D

var speed = 140

func _ready():
	self.collision_layer = 1
	self.collision_mask = 1


func _process(delta):
	# Const.player_data["hits"] = 100  # Invulnerability
	var delta_x = 0
	var delta_y = 0
	if Input.is_action_pressed("right"):
		$Texture.flip_h = true
		delta_x = speed*delta
	elif Input.is_action_pressed("left"):
		$Texture.flip_h = false
		delta_x = -speed*delta
	if Input.is_action_pressed("down"):
		delta_y = speed*delta
	elif Input.is_action_pressed("up"):
		delta_y = -speed*delta
	self.move_and_collide(Vector2(delta_x, delta_y))
	
	if Input.is_action_pressed("right") or Input.is_action_pressed("left") or \
	   Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		$Texture.play("walk")
	else:
		$Texture.play("stay")
	
	
