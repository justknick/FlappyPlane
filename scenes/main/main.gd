extends Control

@onready var bgm_sound: AudioStreamPlayer = $BGMSound


func _ready():
	bgm_sound.play()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fly") == true:
		GameManager.load_scene()
