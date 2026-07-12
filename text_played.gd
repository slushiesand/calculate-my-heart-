extends RichTextLabel

@export var onward_value = 0

func _process(delta: float) -> void:
	pass

func _on_text_onward(value: int) -> void:
	
	if (value == onward_value) and (visible == false):
		show()
	else:
		hide()
