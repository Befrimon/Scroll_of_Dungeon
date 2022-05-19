extends Node2D

func _ready():
	$Player.speed *= 2


func _process(delta):
	if $Wardrobe/ActionArea.overlaps_body($Player):
		$Wardrobe/Texture.play("active")
	else: $Wardrobe/Texture.play("static")
	
	
	if $Bed/ActionArea.overlaps_body($Player):
		$Bed/Texture.play("active")
	else: $Bed/Texture.play("static")
	
	if $Exit.overlaps_body($Player):
		get_tree().change_scene("res://scenes/Road.tscn")
