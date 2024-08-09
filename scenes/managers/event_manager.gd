extends Node

signal ShowRadialMenu

var is_radial_showing = false

func create_node(position : Vector2, node_type):
	show_radial_menu(position)
	
func show_radial_menu(position : Vector2):
	if not is_radial_showing:
		emit_signal("ShowRadialMenu", position)
		is_radial_showing = true


func create_conenction(node1, node2):
	pass

func break_connection():
	pass
