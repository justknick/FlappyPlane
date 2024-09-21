extends Control

@onready var bgm_sound: AudioStreamPlayer = $BGMSound
@onready var start_label: Label = $MarginContainer/StartLabel
@onready var score_label: Label = $MarginContainer/ScoreLabel

var start_game_msg = false

func _ready():
	bgm_sound.play()
	score_label.text = str(ScoreManager.get_high_score())


func _process(_delta: float) -> void:
	if start_game_msg == true:
		if Input.is_action_just_pressed("fly") == true:
			GameManager.load_game_scene()


func _on_timer_timeout() -> void:
	start_game_msg = true
	start_label.visible = true
