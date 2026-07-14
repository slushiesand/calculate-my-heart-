extends Control

func _ready() -> void:
	var tween = get_tree().create_tween().set_loops()
	var position_default = $".".get_position()[1]
	
	tween.tween_property($".", "position:y", position_default + 10.0, 1.0)
	tween.tween_property($".", "position:y", position_default, 1.0)
	
