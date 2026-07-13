extends AudioStreamPlayer

const reg = preload("res://sounds/Fox Tale Waltz Part 1 Instrumental.mp3")
const tense = preload("res://sounds/I Can Feel it Coming.mp3")
const unsettle = preload("res://sounds/Feral Angel Waltz .mp3")
const battle = preload("res://sounds/Darkling.mp3")

var music_dict = {
	1 : reg,
	2 : tense,
	3 : unsettle,
	4 : battle
}

func _play_music(music: AudioStream):
	
	if stream == music:
		return
	
	stream = music
	if stream == battle:
		volume_db = -15.0
	elif stream == unsettle:
		volume_db = 0.0
	else:
		volume_db = -8.0
	play()
	#you may ask: why didn't you do a dictionary for this. 
	# and to that i say: that would probably be more efficent huh. anyway! 
	
func play_music_level(number: int):
	_play_music(music_dict[number])
