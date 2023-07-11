extends Popup
class_name CardDeckPopup


const FlatCard = preload("res://models/card/flat_card.tscn")


func setup(remaining_dict: Dictionary, discarded_dict: Dictionary) -> void:
	_setup_container(%RemainingFoodMaterialsContainer, remaining_dict['food_materials'])
	_setup_container(%RemainingCostomersContainer, remaining_dict['customers'])
	_setup_container(%RemainingDecorationsContainer, remaining_dict['decorations'])
	_setup_container(%DiscardedFoodMaterialsContainer, discarded_dict['food_materials'])
	_setup_container(%DiscardedCostomersContainer, discarded_dict['customers'])
	_setup_container(%DiscardedDecorationsContainer, discarded_dict['decorations'])


func _setup_container(container: Node, cards: Array) -> void:
	for card in cards:
		var flat_card = FlatCard.instantiate()
		flat_card.card = card
		container.add_child(flat_card)


func _clear() -> void:
	var containers: Array[Node] = [
		%RemainingFoodMaterialsContainer,
		%RemainingCostomersContainer,
		%RemainingDecorationsContainer,
		%DiscardedFoodMaterialsContainer,
		%DiscardedCostomersContainer,
		%DiscardedDecorationsContainer
	]
	for container in containers:
		_free_all(container.get_children())


func _free_all(arr: Array[Node]) -> void:
	for node in arr:
		node.queue_free()


func _on_popup_hide() -> void:
	_clear()
