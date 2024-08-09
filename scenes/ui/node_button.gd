extends TextureButton

@export var node_type = 1

func _on_pressed():
	EventManager.create_node(node_type)
