extends Node
class_name Utils


static func free_all_children(node: Node) -> void:
	for child in node.get_children():
		child.queue_free()
