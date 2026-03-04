extends Node

var array = []
var result = []
var list 
func get_chinese_fact():
	for i in array:
		var http = HTTPRequest.new()
		var url = "http://101.35.2.25/api/zici/baikebaidu.php?id=10009364&key=d5b0d4b0e78b2a1e1ae07a7617285216&words="+i
		add_child(http)
		http.request_completed.connect(_on_fact_received.bind(i))
		http.request(url)

func _on_fact_received(_result, code, _headers, body, i):
	if _result == HTTPRequest.RESULT_SUCCESS and code == 200:
		var data = JSON.parse_string(body.get_string_from_utf8())
		if data and data.get("msg"):
			if data["msg"].size()<20:
				pass

func _ready() -> void:
	var file= FileAccess.open("res://text.json",FileAccess.READ)
	list = JSON.parse_string(file.get_as_text())["text"]
	get_chinese_fact()
