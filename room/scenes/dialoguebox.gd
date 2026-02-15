extends CanvasLayer
class_name DialogueBox

@export_multiline var dialoguelist: Array[String]
@export var label : Label

var index: int = 0


func _ready() -> void:
	play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play() -> void:
	visible = true
	index = 0
	print(index)
	label.text = dialoguelist[index]


func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		index += 1
		if index >= dialoguelist.size():
			visible = false
			return
		label.text = dialoguelist[index]
		
