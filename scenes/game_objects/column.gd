extends Node2D

class_name Column

@onready var audio_stream_player: AudioStreamPlayer = $ScoreSound
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

# prevent game from scoring twice from one laser
var count_once = false


func _process(delta) -> void:
	position.x -= GameManager.SCROLL_SPEED * delta


# course 59.18 - troubleshoot needed
#func _on_plane_defeat() -> void:
	#set_process(false)


func _on_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	#print("Collision with ", body)
	
	if body is PlayerPlane:
		body.defeat()
	
	#if body.is_in_group(GameManager.GROUP_PLANE) == true:
		#if body.has_method("defeat") == true:
			#body.defeat()
	#SignalManager.on_plane_defeat.emit()


func _on_laser_body_entered(body: Node2D) -> void:
	if count_once == true:
		return
	else:
		if body is PlayerPlane:
			audio_stream_player.play()
			ScoreManager.increment_score()
			count_once = true
			#print(count_once)


func _on_laser_body_exited(_body: Node2D) -> void:
	count_once = false
	#print(count_once)
