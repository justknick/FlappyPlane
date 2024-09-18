extends Control

@onready var bgm_sound: AudioStreamPlayer = $BGMSound
@onready var start_label: Label = $MarginContainer/StartLabel

var startable = false

func _ready():
	bgm_sound.play()


func _process(_delta: float) -> void:
	if startable == true:
		if Input.is_action_just_pressed("fly") == true:
			GameManager.load_game_scene()


func _on_timer_timeout() -> void:
	startable = true
	start_label.visible = true
