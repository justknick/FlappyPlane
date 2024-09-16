extends CharacterBody2D

const GRAVITY: float = 600.0
const POWER: float = -200.0


func _physics_process(delta: float) -> void:
	# set gravity effect 
	velocity.y += GRAVITY * delta
	# get player input  
	fly()
	
	move_and_slide()


func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
