extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func switch_scenes() -> void:
	get_tree().change_scene_to_packed(GameManager.next_scene)
