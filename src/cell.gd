extends Panel
class_name Cell
@onready var label: Label = $Label

enum State{
	UnKnowWord,#黑色
	KnowWord,#绿色
	UnGussWord,#透明白色边框
	Mark,#标点符号
	Block,#占位
	FalseWord#错误的词
}
var state = State.UnKnowWord

func init(word:String) -> void:
	label.text = word
	
func set_state(_name:String) -> void:
	if state == State.FalseWord:
		return
	match _name:
		"UnKnowWord":
			state = State.UnKnowWord
		"KnowWord":
			state = State.KnowWord
		"UnGussWord":
			state = State.UnGussWord
		"Mark":
			state = State.Mark
		"Block":
			state = State.Block
		"FalseWord":
			state = State.FalseWord
	update()
func update() -> void:
	match state:
		State.UnKnowWord:
			unknowword()
		State.KnowWord:
			knowword()
		State.UnGussWord:
			ungussword()
		State.Block:
			block()
		State.Mark:
			mark()
		State.FalseWord:
			falseword()
func unknowword():
	label.visible = false
	var styles:StyleBoxFlat = StyleBoxFlat.new()
	styles.bg_color = Color.BLACK
	add_theme_stylebox_override("panel" , styles)
	
func knowword():
	label.visible = true
	label.modulate = Color.WHITE
	var styles:StyleBoxFlat = StyleBoxFlat.new()
	styles.bg_color = Color.DARK_GREEN
	add_theme_stylebox_override("panel" , styles)
	
func ungussword():
	label.visible = true
	label.modulate = Color.BLACK
	var styles:StyleBoxFlat = StyleBoxFlat.new()
	styles.bg_color = Color(0,0,0,0)
	styles.border_width_bottom = 2
	styles.border_width_left = 2
	styles.border_width_right = 2
	styles.border_width_top = 2
	add_theme_stylebox_override("panel" , styles)
	
func block():
	label.visible = false
	modulate = Color(0,0,0,0)
	
func mark():
	label.visible = true
	label.modulate = Color.BLACK
	var styles:StyleBoxFlat = StyleBoxFlat.new()
	styles.bg_color = Color(0,0,0,0)
	add_theme_stylebox_override("panel",styles)
	
func falseword():
	label.visible = true
	label.modulate = Color.WHITE
	var styles:StyleBoxFlat = StyleBoxFlat.new()
	styles.bg_color = Color.INDIAN_RED
	add_theme_stylebox_override("panel",styles)

func get_word() -> String:
	return label.text

func is_unknow():
	return state == State.UnKnowWord
