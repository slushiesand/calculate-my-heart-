extends Node

@export var toSolve = 0
@export_file var level
var hasSolved = 0

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_equation_answered() -> void:
	hasSolved += 1
	
	if hasSolved == toSolve:
		print("transition")
		
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file(level)
