extends Node2D

class_name Creator

@export var creation_rate = 5

var node_type = 1
var connection : Line2D = null
var connected_node : Node2D = null

func setup_connection(other_node, new_connection):
	if connection != null:
		return false
	if other_node.node_type == 2:
		if other_node.connection != null:
			return false
		connected_node = other_node
		connection = new_connection
		other_node.connection = new_connection
		other_node.connected_node = self
		return true

func break_connection():
	if connection != null:
		connection.queue_free()
	connected_node = null

func _on_button_pressed():
		EventManager._on_create_conenction(self)
	
func _on_button_gui_input(event : InputEvent):
	if event.is_action("delete"):
		break_connection()
		queue_free()
