extends Node

@export var toSolve = 0
@export var nextScene = ""
var hasSolved = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if hasSolved == toSolve:
		pass
		#transition to the next level
