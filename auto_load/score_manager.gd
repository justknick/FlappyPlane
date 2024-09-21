extends Node

const SCORE_SAVE_DATA = "user://tappy_data.dat"

var _score: int = 0
var _high_score: int = 0


func _ready() -> void:
	load_high_score()


func get_score() -> int:
	return _score


func get_high_score() -> int:
	return _high_score


func set_score(v: int) -> void:
	_score = v
	set_high_score(_score)
	SignalManager.on_score_updated.emit(_score)


func set_high_score(v: int) -> void:
	if v > _high_score:
		_high_score = v


func increment_score() -> void:
	set_score(_score + 1)


func load_high_score() -> void:
	var file = FileAccess.open(SCORE_SAVE_DATA, FileAccess.READ)
	if file:
		if file.get_length() > 0:
			# retrieves hexidecimal value as int
			#_high_score = file.get_32()
			# retrieves as text and converts to int
			_high_score = file.get_as_text().to_int()
			#print("loaded high score")
		#else:
			#print("loaded but no high score")
		# close file
		file.close()
	#else:
		#print("failed to load file..")


func save_highscore_to_file() -> void:
	var file = FileAccess.open(SCORE_SAVE_DATA, FileAccess.WRITE)
	if file:
		# stores value as hexidecimal
		#file.store_32(_high_score)
		# stores value as string
		file.store_string(str(_high_score))
		# close file 
		file.close()
		#print("score saved! ")
