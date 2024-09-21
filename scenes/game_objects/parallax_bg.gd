extends Parallax2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var texture: Texture2D


func _ready() -> void:
	var scale_factor = get_viewport_rect().size.y / texture.get_height()
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_factor, scale_factor)
	repeat_size.x = texture.get_width() * scale_factor
	SignalManager.on_plane_defeat.connect(on_defeat)


func _process(delta: float) -> void:
	screen_offset.x += GameManager.SCROLL_SPEED * delta


func on_defeat() -> void:
	set_process(false)
