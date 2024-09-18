extends Control

@onready var bgm_sound: AudioStreamPlayer = $BGMSound


func _ready():
	bgm_sound.play()
