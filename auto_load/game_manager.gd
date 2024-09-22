extends Node

const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN: PackedScene = preload("res://scenes/main/main.tscn")
const TRANSITION: PackedScene = preload("res://scenes/ui/transition.tscn")
const TRANSITION_2 = preload("res://scenes/ui/transition_2.tscn")

const SCROLL_SPEED: float = 145.0
const GROUP_PLANE: String = "plane"

var next_scene: PackedScene 


func load_next_scene(scene: PackedScene) -> void: 
	next_scene = scene
	#get_tree().change_scene_to_packed(TRANSITION)
	var create_transition = TRANSITION_2.instantiate()
	add_child(create_transition)


func load_game_scene() -> void:
	#get_tree().change_scene_to_packed(GAME)
	load_next_scene(GAME)


func load_main_scene() -> void:
	#get_tree().change_scene_to_packed(MAIN)
	load_next_scene(MAIN)
