extends Node

var processor_node = preload("res://scenes/nodes/processor.tscn")
var creator_node = preload("res://scenes/nodes/creator.tscn")
var node_position : Vector2

func save_position(new_position : Vector2):
	node_position = new_position

func create_node(node_type):
	if node_type <= 0 or node_type > 3:
		return
	
	var main = get_tree().root.get_node("Main")
	if node_type == 2: #processor_node
		var processor_node_instance = processor_node.instantiate()
		main.get_node("Instances").add_child(processor_node_instance)
		processor_node_instance.position = node_position
	elif node_type == 1: #creator_node
		var creator_node_instance = creator_node.instantiate()
		main.get_node("Instances").add_child(creator_node_instance)
		creator_node_instance.position = node_position
	

func create_conenction(node1, node2):
	pass

func break_connection():
	pass
