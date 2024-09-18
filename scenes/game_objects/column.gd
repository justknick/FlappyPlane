extends Node2D

class_name Column

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# course 59.18 - troubleshoot needed
#func _ready() -> void:
	#SignalManager.on_plane_defeat.connect(_on_plane_defeat)


func _process(delta) -> void:
	position.x -= GameManager.SCROLL_SPEED * delta
	# extra measure for various os devices
	check_is_off_screen()


func check_is_off_screen() -> void:
	if position.x <= -200:
		_on_screen_exited()

# course 59.18 - troubleshoot needed
#func _on_plane_defeat() -> void:
	#set_process(false)


func _on_screen_exited() -> void:
	#print("gone")
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerPlane:
		body.defeat()
	
	#if body.is_in_group(GameManager.GROUP_PLANE) == true:
		#if body.has_method("defeat") == true:
			#body.defeat()
	#SignalManager.on_plane_defeat.emit()


func _on_laser_body_entered(body: Node2D) -> void:
	if body is PlayerPlane:
		audio_stream_player.play()
