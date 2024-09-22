extends Node2D

@onready var column_spawn_manager: Node = $ColumnSpawnManager
@onready var delay_start_timer: Timer = $DelayStartTimer


func _ready() -> void:
	ScoreManager.set_score(0)
	SignalManager.on_plane_defeat.connect(_on_plane_defeat)
	delay_start_timer.timeout.connect(on_begin_spawn)


func on_begin_spawn() -> void:
	column_spawn_manager.timer.start() 


func _on_plane_defeat() -> void:
	#print("defeated")
	column_spawn_manager.stop_spawn_column()
