extends OptionButton


func _ready():
	for item in range(len(Const.LANG_LIST)):
		self.add_item(Const.LANG_LIST[item], item)
	self.selected = Const.SELECT_LANG
