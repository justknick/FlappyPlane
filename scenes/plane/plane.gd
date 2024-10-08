extends CharacterBody2D

class_name PlayerPlane

@onready var plane_animated_sprite: AnimatedSprite2D = $PlaneAnimatedSprite
@onready var plane_animated_player: AnimationPlayer = $PlaneAnimatedPlayer
@onready var plane_sound: AudioStreamPlayer = $PlaneSound

const GRAVITY: float = 1000.0
const POWER: float = -375.0


func _physics_process(delta: float) -> void:
	# set gravity effect 
	velocity.y += GRAVITY * delta
	# get player input  
	fly()
	
	move_and_slide()
	
	if is_on_floor() == true:
		defeat()
	if is_on_ceiling() == true:
		defeat()  


func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		plane_animated_player.play("power")


func defeat() -> void:
	set_physics_process(false)
	plane_animated_sprite.stop()
	plane_sound.stop()
	SignalManager.on_plane_defeat.emit()
