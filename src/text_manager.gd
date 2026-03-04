extends Node
class_name TextManager

@export var Grid_Cell : GridContainer
@export var messageManager : MessageManager
@onready var text_edit: TextEdit = $"../Panel/VBoxContainer/MarginContainer/HBoxContainer/TextEdit"
@onready var button: Button = $"../Panel/VBoxContainer/MarginContainer/HBoxContainer/Button"
var WordList:Array[String]
var theme:String
var is_win = true

func loadtext(guss_data: GussData):
	for i in Grid_Cell.get_children():
		i.queue_free()
	is_win = false
	WordList.clear()
	
	var count = 0
	var _text = guss_data.theme+"\n"+guss_data.text+"\n"
	theme = guss_data.theme
	for word in _text:
		if word=="\n":
			var num = 14-count%14
			for i in range(num):
				var cell:Cell = preload("res://scene/cell.tscn").instantiate()
				Grid_Cell.add_child(cell)
				cell.set_state("Block")
				count+=1
		elif is_punctuation(word):
			var cell:Cell = preload("res://scene/cell.tscn").instantiate()
			Grid_Cell.add_child(cell)
			cell.init(word)
			cell.set_state("Mark")
			count+=1
		else:
			var cell:Cell = preload("res://scene/cell.tscn").instantiate()
			Grid_Cell.add_child(cell)
			cell.init(word)
			cell.set_state("UnKnowWord")
			count+=1

func is_punctuation(_text: String) -> bool:
	# 英文标点
	var english_punctuation = [",", ".", "!", "?", ":", ";", "'", "\"", "(", ")", "[", "]", "{", "}", "-", "_", "..."]
	# 中文标点  
	var chinese_punctuation = ["，", "。", "！", "？", "：", "；", "「", "」", "『", "』", "（", "）", "【", "】", "《", "》", "、", "…"]
	var all_punctuation = english_punctuation + chinese_punctuation
	return all_punctuation.has(_text)


func _on_button_pressed() -> void:
	var word:String = text_edit.text
	if word.length()!=1:
		messageManager.create_warn("只允许输入一个字")
		return
	text_edit.clear()
	if word in WordList:
		messageManager.create_warn("你已经猜过这个字")
	WordList.append(word)
	var is_false = true
	for cell:Cell in Grid_Cell.get_children():
		if cell.get_word()==word:
			is_false = false
			cell.set_state("KnowWord")
	if is_false:
		add_false_word(word)
		messageManager.create_warn("猜测的字不在内容中")
	judge_win()
	
func add_false_word(word:String):
	var cell = preload("res://scene/cell.tscn").instantiate()
	Grid_Cell.add_child(cell)
	cell.init(word)
	cell.set_state("FalseWord")
	
func _on_text_edit_text_set() -> void:
	if text_edit.text.length()==0:
		button.disabled = true
	else:
		button.disabled = false

func _on_text_edit_text_changed() -> void:
	if text_edit.text.length()==0:
		button.disabled = true
	else:
		button.disabled = false
	if text_edit.text.length()==0:
		return 
	if text_edit.text.contains("\n"):
		text_edit.text = text_edit.text.erase(text_edit.text.find("\n"))
		_on_button_pressed()
		text_edit.set_caret_column(text_edit.text.length())

func judge_win():
	for word in theme:
		if word not in WordList:
			return 
	win()

func win():
	is_win = true
	for cell:Cell in Grid_Cell.get_children():
		if cell.is_unknow():
			cell.set_state("UnGussWord")
