extends Node

@export var messageManager : MessageManager
@export var textManager : TextManager
var array_guss_data:Array[GussData]
var id = '10009364'
var key = 'd5b0d4b0e78b2a1e1ae07a7617285216'

func get_chinese_fact():
	var http = HTTPRequest.new()
	var file = FileAccess.open("res://text.json",FileAccess.READ)
	var list:Array = JSON.parse_string(file.get_as_text())["text"]
	var theme = list[randi()%list.size()]
	var url = "http://101.35.2.25/api/zici/baikebaidu.php?id="+id+"&key="+key+"&words="+theme
	add_child(http)
	http.request_completed.connect(_on_fact_received.bind(theme))
	http.request(url)
	await http.request_completed

func _on_fact_received(result, code, _headers, body, theme):
	if result == HTTPRequest.RESULT_SUCCESS and code == 200:
		var data = JSON.parse_string(body.get_string_from_utf8())
		if data and data.get("msg"):
			if data["msg"].length()>20:
				array_guss_data.append(GussData.new(theme,data["msg"]))
			else:
				get_chinese_fact()
				return
	else:
		messageManager.create_warn("网络错误请重试")

func _ready() -> void:
	get_chinese_fact()
	get_chinese_fact()
	

func _on_button_pressed() -> void:
	if textManager.is_win:
		get_chinese_fact()
		textManager.loadtext(array_guss_data.pop_front())
	else:
		var choose = preload("res://scene/choose.tscn").instantiate()
		choose.enterkey.connect(judge)
		$"../CanvasLayer".add_child(choose)
func judge(_is):
	if _is == "yes":
		get_chinese_fact()
		textManager.loadtext(array_guss_data.pop_front())
