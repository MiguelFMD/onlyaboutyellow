extends Node

@onready var radial_menu = preload("res://scenes/ui/radial_menu.tscn")

func _ready():
	EventManager.connect("ShowRadialMenu", Callable(self, "_on_show_radial_menu"))

func _on_show_radial_menu(position : Vector2):
	var instant : Control = radial_menu.instantiate()
	instant.position = position
	add_child(instant)
	
