extends Node


var main
var processor_node = preload("res://scenes/nodes/processor.tscn")
var creator_node = preload("res://scenes/nodes/creator.tscn")
var connection = preload("res://scenes/nodes/connection.tscn")
var node_position : Vector2
var first_node
var second_node


func _ready():
	main = get_tree().root.get_node("Main")

func save_position(new_position : Vector2):
	node_position = new_position

func create_node(node_type):
	first_node = null
	second_node = null
	if node_type <= 0 or node_type > 3:
		return
	if node_type == 2: #processor_node
		var processor_node_instance = processor_node.instantiate()
		main.get_node("Instances").add_child(processor_node_instance)
		processor_node_instance.position = node_position
	elif node_type == 1: #creator_node
		var creator_node_instance = creator_node.instantiate()
		main.get_node("Instances").add_child(creator_node_instance)
		creator_node_instance.position = node_position
	

func _on_create_conenction(node):
	if first_node == null:
		first_node = node
	elif second_node == null:
		second_node = node
		if first_node.node_type != second_node.node_type:
			var connection_instance = connection.instantiate()
			main.get_node("Instances").add_child(connection_instance)
			if first_node.setup_connection(second_node, connection_instance):
				connection_instance.add_point(first_node.position)
				connection_instance.add_point(second_node.position)
		second_node = null
		first_node = null

func break_connection():
	pass
