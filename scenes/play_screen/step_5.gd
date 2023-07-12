extends "res://scenes/play_screen/step_base.gd"


var play_screen: PlayScreen

var _materials: Array[FoodMaterial] = []


func _ready() -> void:
	super._ready()

	play_screen = owner as PlayScreen
	assert(play_screen != null)


func _on_show() -> void:
	_clear()
	_connect_input()

	var customer = state.customer as Customer
	%VisualCard.card = customer

	for need in customer.needs:
		for property in ['name', 'description', 'reward']:
			var label = Label.new()
			label.text = str(need.get(property))
			%NeedContainer.add_child(label)

	_update()


func _connect_input() -> void:
	Utils.try_connect(play_screen.get_node("%PlayerArea").cards_selected, _on_cards_selected)


func _disconnect_input() -> void:
	Utils.try_disconnect(play_screen.get_node("%PlayerArea").cards_selected, _on_cards_selected)


func _update() -> void:
	%SubmitButton.disabled = !state.customer.can_be_fulfilled_by(_materials)
	%DiscardButton.disabled = len(_materials) < 1


func _on_cards_selected(cards: Array[FoodMaterial]) -> void:
	_materials = cards
	_update()


func _clear() -> void:
	Utils.free_all(%NeedContainer.get_children().slice(3))
	Utils.free_all(%EventContainer.get_children().slice(2))


func _on_hidden() -> void:
	_clear()
	_disconnect_input()


func _on_submit_button_pressed() -> void:
	state.submit(_materials)
	_materials = []
	_update()


func _on_discard_button_pressed() -> void:
	state.discard(_materials)
	_materials = []
	_update()
