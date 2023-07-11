@tool
extends Control
class_name PlayScreen


var turn := 0

@onready var players: Array[Player] = []

var remaining_cards := {
	'food_materials': [] as Array[FoodMaterial],
	'customers': [] as Array[Customer],
	'decorations': [] as Array[Decoration]
}

var remaining_food_materials: Array[FoodMaterial]:
	get: return remaining_cards['food_materials']

var remaining_customers: Array[Customer]:
	get: return remaining_cards['customers']

var remaining_decorations: Array[Decoration]:
	get: return remaining_cards['decorations']

var discarded_cards := {
	'food_materials': [] as Array[FoodMaterial],
	'customers': [] as Array[Customer],
	'decorations': [] as Array[Decoration]
}

var discarded_food_materials: Array[FoodMaterial]:
	get: return discarded_cards['food_materials']

var discarded_customers: Array[Customer]:
	get: return discarded_cards['customers']

var discarded_decorations: Array[Decoration]:
	get: return discarded_cards['decorations']


func _ready() -> void:
	_init_players()

	if not Engine.is_editor_hint():
		Log.push("创建游戏界面。")


func _init_players() -> void:
	for player in %Players.get_children():
		if player is Player:
			players.push_back(player)


func _process(_delta: float) -> void:
	_update_card_stack_displays()


func _update_card_stack_displays() -> void:
	_update_card_stack_display(%RemainingCardStackDisplay, remaining_cards)
	_update_card_stack_display(%DiscardedCardStackDisplay, discarded_cards)


func _update_card_stack_display(display: CardStackDisplay, dict: Dictionary) -> void:
	display.set_numbers(
		len(dict['food_materials']),
		len(dict['customers']),
		len(dict['decorations'])
	)


func _on_show_card_deck_button_pressed() -> void:
	var popup: CardDeckPopup = %CardDeckPopup
	popup.setup(remaining_cards, discarded_cards)
	popup.popup_centered()


func begin_next_turn() -> void:
	turn += 1
	Log.push("第 %d 回合" % turn)


func get_food_material_card() -> FoodMaterial:
	return _get_card(remaining_food_materials, discarded_food_materials, "食材卡洗牌了。")


func get_customer_card() -> Customer:
	return _get_card(remaining_customers, discarded_customers, "客人卡洗牌了。")


func get_decoration_card() -> Customer:
	return _get_card(remaining_decorations, discarded_decorations, "装扮卡洗牌了。")


func _get_card(remaining_deck: Array, discarded_deck: Array, log_when_shuffle: String) -> Card:
	if len(remaining_deck) == 0:
		discarded_deck.shuffle()
		remaining_deck.append_array(discarded_deck)
		discarded_deck.clear()
		Log.push(log_when_shuffle)
	return remaining_deck.pop_back()
