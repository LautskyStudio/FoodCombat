extends "res://scenes/play_screen/step_base.gd"


var play_screen: PlayScreen


func _ready() -> void:
	super._ready()

	play_screen = owner as PlayScreen
	assert(play_screen != null)
	play_screen.get_node("%PlayerArea").cards_selected.connect(_on_cards_selected)


func _on_show() -> void:
	_clear()

	var customer = state.customer as Customer
	%VisualCard.card = customer

	for need in customer.needs:
		for property in ['name', 'description', 'reward']:
			var label = Label.new()
			label.text = str(need.get(property))
			%NeedContainer.add_child(label)


func _on_cards_selected(cards: Array[FoodMaterial]) -> void:
	pass


func _clear() -> void:
	Utils.free_all_children(%NeedContainer)
	Utils.free_all_children(%EventContainer)


func _on_hidden() -> void:
	_clear()
