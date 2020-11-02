extends Control


func _ready():
	$PlayButton.connect("on_click", self, "_play_game")
	$ControlsButton.connect("on_click", self, "_go_to_controls")
	$ExitButton.connect("on_click", self, "_exit_game")


func _play_game():
	SCENE.go_to_game()


func _go_to_controls():
	SCENE.go_to_controls()


func _exit_game():
	SCENE.exit_game()
