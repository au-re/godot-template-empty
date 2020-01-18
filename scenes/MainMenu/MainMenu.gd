extends Control


onready var Play = $Play;
onready var Load = $Load;
onready var Exit = $Exit;

func go_to_game():
	SCENE.go_to_game()


func load_game():
	SCENE.go_to_game()


func exit_game():
	SCENE.exit_game()


func _ready():
	Play.connect("button_up", self, "go_to_game")
	Load.connect("button_up", self, "load_game")
	Exit.connect("button_up", self, "exit_game")
