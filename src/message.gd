extends Panel

@onready var label: Label = $Label

func init(_text:String):
	label.text = _text
	await get_tree().create_timer(0.5).timeout
	await get_tree().create_tween().tween_property(
		self,
		"modulate",
		Color(245,245,245,0),
		0.5
	).finished
	queue_free()
