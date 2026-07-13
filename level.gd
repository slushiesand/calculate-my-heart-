extends Node

@export var toSolve = 0
@export_file var level
@export var timed = false
@export var music = 1
var hasSolved = 0

@onready var timer = $Control/Timer

func _ready() -> void:
	GlobalAudioStreamPlayer.play_music_level(music)
	if timed:
		$Control/visibleTimer.show()
		timer.start()

func _process(delta: float) -> void:
	$Control/visibleTimer.set_text( str(timer.get_time_left()).pad_decimals(2) )

func _on_equation_answered() -> void:
	hasSolved += 1
	
	if hasSolved == toSolve:
		print("transition")
		
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file(level)


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://debug.tscn")
