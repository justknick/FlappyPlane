extends Node2D

@onready var column_spawn_manager: Node = $ColumnSpawnManager


func _ready() -> void:
	SignalManager.on_plane_defeat.connect(_on_plane_defeat)


func _on_plane_defeat() -> void:
	#print("defeated")
	column_spawn_manager.stop_spawn_column()
	
