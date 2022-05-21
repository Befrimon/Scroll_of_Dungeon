extends Node2D

var player
var lamps = []
var ui


func _ready():
	var clr = int(abs(Const.lamp_count)/2)+1
	$Dark/AnimationPlayer.current_animation = str(clr)
	
	player = load("res://sprites/Player.tscn").instance()
	player.position.x = Const.player_data["position"][0]
	player.position.y = Const.player_data["position"][1]
	self.add_child(player)
	
	for _i in range(abs(Const.lamp_count)):
		var lamp = load("res://sprites/LampMob.tscn").instance()
		lamp.position.x = rand_range(150, 900)
		lamp.position.y = rand_range(80, 520)
		self.add_child(lamp)
	
	ui = load("res://sprites/Interface.tscn").instance()
	self.add_child(ui)

func _process(_delta):
	if (Const.lamp_count == 1 and player.position.x <= 0) or \
	   (Const.lamp_count == -1 and player.position.x >= 1024):
		Const.lamp_count = 0
		Const.player_data["position"] = [30, 300]
		get_tree().change_scene("res://scenes/Road.tscn")
	
	elif player.position.x >= 1024:
		Const.lamp_count += 2
		Const.player_data["position"] = [30, player.position[1]]
		get_tree().reload_current_scene()
	elif player.position.x <= 0:
		Const.lamp_count -= 2
		Const.player_data["position"] = [996, player.position[1]]
		get_tree().reload_current_scene()
	elif player.position.y <= 0:
		Const.player_data["position"] = [player.position[0], 570]
		get_tree().reload_current_scene()
	elif player.position.y >= 600:
		Const.player_data["position"] = [player.position[0], 30]
		get_tree().reload_current_scene()

func _input(event):
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		var ps = load("res://sprites/Pause.tscn").instance()
		add_child(ps)

