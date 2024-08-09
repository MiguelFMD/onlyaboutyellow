extends Node

@onready var popup_menu = preload("res://scenes/ui/popup.tscn")
@onready var button = $Control/MarginContainer/Button

var popup_showing = false
var popup

func _ready():
	button.connect("button_down", Callable(self, "_on_show_popup_menu"))

func _input(event):
	if event.is_pressed() and event is InputEventMouseButton:
		if popup_showing:
			popup.queue_free()
			popup_showing = false

func _on_show_popup_menu():
	if not popup_showing:
		popup = popup_menu.instantiate()
		popup.position = get_viewport().get_mouse_position()
		add_child(popup)
		EventManager.save_position(popup.position)
		popup_showing = true
	else:
		popup.queue_free()
		popup_showing = false

	
