extends Node
class_name Utils


static func free_all_children(node: Node) -> void:
	free_all(node.get_children())


static func free_all(arr: Array[Node]) -> void:
	for node in arr:
		node.queue_free()


static func remove(arr: Array, item) -> void:
	var idx := arr.find(item)
	if idx != -1:
		arr.remove_at(idx)
