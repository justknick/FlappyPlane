extends Node

@onready var timer: Timer = $Timer

@export var column_spawn_manager: PackedScene

var level: int = 0


func _ready() -> void:
	SignalManager.on_plane_defeat.connect(on_defeat)


func on_defeat() -> void:
	timer.stop()


func _on_timer_timeout() -> void:
	level += 1
	#print("level up ", level)
	SignalManager.on_level_up.emit(level)
