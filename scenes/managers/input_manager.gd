extends Node


func _input(event):
	if event.is_pressed() and event is InputEventMouseButton:
		EventManager.create_node(event.position, 2)
	
