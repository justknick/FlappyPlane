extends Node

@export var column_scene: PackedScene

@onready var spawn_marker_upper: Marker2D = $SpawnMarkerUpper
@onready var spawn_marker_lower: Marker2D = $SpawnMarkerLower
@onready var timer: Timer = $Timer


#func _ready() -> void:
	##timer.timeout.connect(on_timer_timeout)
	#pass


func spawn_column() -> void:
	# create column instance, locate the random spot between markers
	var new_column = column_scene.instantiate()
	var spawn_position: float = randf_range(spawn_marker_upper.position.y\
	, spawn_marker_lower.position.y)
	
	# spawn column at the random spot
	new_column.position = Vector2(spawn_marker_upper.position.x, spawn_position)
	add_child(new_column)
	
	#print("spawn!")


func stop_spawn_column() -> void:
	timer.stop()
	
	# course 59.18 - troubleshoot needed
	for column in get_children():
		column.set_process(false)
		set_process(false)


func _on_timer_timeout() -> void:
	spawn_column()
