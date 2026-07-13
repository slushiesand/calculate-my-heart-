extends Node

signal onward(value: int)

@export_file var level
@export var max_onward = 0
@export var music = 1

var onward_value = 0

func _ready() -> void:
	GlobalAudioStreamPlayer.play_music_level(music) 
	
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("enter"):
		
		onward_value += 1
		
		if onward_value == max_onward + 1:
			get_tree().change_scene_to_file(level)
		else:
			onward.emit(onward_value)
