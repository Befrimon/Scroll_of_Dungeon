extends Control


func _process(_delta):
	$Hits.rect_size.x = Const.player_data["hits"]*2
	$Mana.rect_size.x = Const.player_data["mana"]*2
