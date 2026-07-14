extends Node2D

@export var equation = ""
@export var answer = ""
#note: answer should never use W, A, or S to prevent movement whilst typing
@export var derivative = false
@export var indeterminate = false
@export var onward_value = 0
var onward_increase = 0

signal answered
signal new_equation(value: int)

func _ready() -> void:
	$Control/LineEdit.hide()
	$Control/Label.set_text(equation)
	if indeterminate:
		$AnimationPlayer.play("indeterminate")
	else:
		$AnimationPlayer.play("idle")
		
	if derivative:
		$Control/directions.set_text("Differentiate!")
	else:
		$Control/directions.set_text("Integrate!")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		$Control/LineEdit.show()
		$Control/LineEdit.grab_focus()
		$Control/LineEdit.edit()
	
func _on_area_2d_body_exited(_body: Node2D) -> void:
	$Control/LineEdit.hide()
	
func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text == answer:
		$correctSFX.play()
		$Control.hide()
		if derivative:
			$AnimationPlayer.play("derivative")
		else:
			$AnimationPlayer.play("integral")
		
		answered.emit()
		onward_increase += 1
		new_equation.emit(onward_increase)
		await get_tree().create_timer(2.0).timeout
		
		free()
		
	else:
		$incorrectSFX.play()

func _on_new_equation(value: int) -> void:
	onward_increase = value
	if (value == onward_value) and !visible:
		show()
