extends Node2D

var player


func _ready():
	player = load("res://sprites/Player.tscn").instance()
	if Const.player_data["forest_return"] == "right":
		player.position.x = 30
		player.position.y = 300
	elif Const.player_data["forest_return"] == "left":
		player.position.x = 994
		player.position.y = 300
	else:
		player.position.x = 512
		player.position.y = 20
	self.add_child(player)

func _process(delta):
	if player.position.x >= 1024:
		Const.lamp_count += 1
		Const.player_data["forest_return"] = "left"
		Const.player_data["position"][0] = 44
		get_tree().change_scene("res://scenes/Forest.tscn")
	elif player.position.x <= 0:
		Const.lamp_count -= 1
		Const.player_data["forest_return"] = "right"
		Const.player_data["position"][0] = 980
		get_tree().change_scene("res://scenes/Forest.tscn")
	elif player.position.y <= 0:
		player.position.y += player.speed*delta
	elif player.position.y >= 600:
		player.position.y -= player.speed*delta
