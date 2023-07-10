@tool
extends Control
class_name PlayScreen


var turn := 0

@onready var players: Array[Player] = []

var remaining_cards := {
	'food_materials': [],
	'customers': [],
	'decorations': []
}

var discarded_cards := {
	'food_materials': [],
	'customers': [],
	'decorations': []
}


func _ready() -> void:
	_init_players()

	if not Engine.is_editor_hint():
		Log.push("创建游戏界面。")


func _init_players() -> void:
	for player in %Players.get_children():
		if player is Player:
			players.push_back(player)


func begin_next_turn() -> void:
	turn += 1
	Log.push("第 %d 回合" % turn)


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
