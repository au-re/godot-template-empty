extends Node

signal scene_changed()

export var main_menu = "res://scenes/MainMenu/MainMenu.tscn"
export var game = "res://scenes/Template/Template.tscn"


func go_to_main_menu():
	load_scene(main_menu)


func go_to_game():
	load_scene(game)


func exit_game():
	get_tree().quit()


func load_scene(path):
	get_tree().change_scene(path)
	emit_signal("scene_changed")
