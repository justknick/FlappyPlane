extends Node2D

class_name Column

@export var scroll_speed: float = 120.0


func _process(delta) -> void:
	position.x -= scroll_speed * delta
	check_is_off_screen()


func check_is_off_screen() -> void:
	if position.x <= -200:
		_on_screen_exited()


func _on_screen_exited() -> void:
	#print("gone")
	queue_free()
	
