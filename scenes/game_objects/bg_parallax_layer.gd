extends ParallaxLayer

# for this course, we'll use 1920 x 1080
const image_bg_width: float = 1920.0
const image_bg_height: float = 1080.0

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var texture: Texture2D
@export var scroll_scale: float = 0.0


# this scene/script is for one of the parallax backgrounds
func _ready() -> void:
	# motion scale is a property of parallax layer node 
	motion_scale.x = scroll_scale
	# scale the texture sprite to fit the height of the screen
	# for parallax, making assumption it is wider than is taller 
	var scale_factor = get_viewport_rect().size.y / image_bg_height
	
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_factor, scale_factor)
	
	motion_mirroring.x = image_bg_width * scale_factor
