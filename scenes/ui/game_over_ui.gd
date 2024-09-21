extends Control

@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var space_label: Label = $MarginContainer/SpaceLabel
@onready var timer: Timer = $Timer
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound


func _ready() -> void:
	hide()
	SignalManager.on_plane_defeat.connect(on_defeat)


func _process(_delta: float) -> void:
	check_input()


func check_input() -> void:
	if space_label.visible && Input.is_action_just_pressed("fly"):
		GameManager.load_main_scene()


func on_defeat():
	ScoreManager.save_highscore_to_file()
	#print("saving...")
	show()
	timer.start()
	game_over_sound.play()


func _on_timer_timeout() -> void:
	#print("timeout")
	game_over_label.hide()
	space_label.show()
