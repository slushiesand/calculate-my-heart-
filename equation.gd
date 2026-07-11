extends Node2D

@export var equation = ""
@export var answer = ""
@export var sprite = 0
var spriteVariation = ["this isn't implemented yet"]

func _ready() -> void:
	pass
	$Control.hide()
	$Control/Label.set_text(equation)
	# $AnimatedSprite2D.play(spriteVariation[sprite]) 

func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(_body: Node2D) -> void:
	$Control.show()
	$Control/LineEdit.grab_focus()
	$Control/LineEdit.edit()
	
func _on_area_2d_body_exited(_body: Node2D) -> void:
	$Control.hide()
	
func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text == answer:
		$Control.hide()
		print("yay")
		# make a signal to send to level script to update hasSolved
		
		# $AnimatedSprite2D.play(spriteVariation[sprite]) 
		# disappear but for debug purposes this will not be implemented yet
		
	else:
		print("no")
		# sfx prob
		
