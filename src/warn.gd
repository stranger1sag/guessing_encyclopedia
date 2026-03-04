extends VBoxContainer
class_name MessageManager

func create_warn(text:String):
	var warn = preload("res://scene/message.tscn").instantiate()
	add_child(warn)
	warn.init(text)
