extends Panel

signal enterkey


func _on_yes_pressed() -> void:
	enterkey.emit("yes")
	queue_free()

func _on_no_pressed() -> void:
	enterkey.emit("no")
	queue_free()
