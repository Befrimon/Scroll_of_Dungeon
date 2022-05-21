extends Node2D

func _ready():
	$Player.speed *= 2


func _process(delta):
	if $Wardrobe/ActionArea.overlaps_body($Player):
		$Wardrobe/Texture.play("active")
	else: $Wardrobe/Texture.play("static")
	
	if $Bed/ActionArea.overlaps_body($Player):
		$Bed/Texture.play("active")
		if Input.is_action_pressed("interaction"):
			get_tree().change_scene("res://scenes/GameOver.tscn")
	else: $Bed/Texture.play("static")
	
	if $Exit.overlaps_body($Player):
		get_tree().change_scene("res://scenes/Road.tscn")


func _input(event):
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		add_child(load("res://sprites/Pause.tscn").instance())
