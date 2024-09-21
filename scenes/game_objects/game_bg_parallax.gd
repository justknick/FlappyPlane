extends ParallaxBackground


func _ready():
	SignalManager.on_plane_defeat.connect(on_defeat)


func _process(delta: float) -> void:
	scroll_offset.x -= GameManager.SCROLL_SPEED * delta


func on_defeat() -> void: 
	set_process(false)
