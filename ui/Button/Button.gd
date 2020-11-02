extends Control

signal on_click

export var label = ""
export var color = Color("#ffffff")


func _ready():
	$Label.text = label
	$ColorRect.color = color
	$ColorRect.connect("mouse_entered", self, "_on_mouse_entered")
	$ColorRect.connect("gui_input", self, "_on_input_event")


func _on_mouse_entered():
	pass


func _on_input_event(ev):
	if ev is InputEventMouseButton and ev.pressed:
		$UI.play()
		emit_signal("on_click")
