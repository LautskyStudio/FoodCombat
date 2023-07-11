extends VBoxContainer


const FlatCard = preload("res://models/card/flat_card.tscn")


@export var player_path := NodePath()
var player := Player.new()


func _ready() -> void:
	if player_path:
		if player:
			player.queue_free()
		player = get_node(player_path)

	%PlayerNameLabel.text = player.player_name

	if player.player_index < Settings.player_number:
		show()
	else:
		hide()

	player.waiting_area_changed.connect(func (cards): _on_card_deck_changed(%WaitingArea, cards))
	player.eating_area_changed.connect(func (cards): _on_card_deck_changed(%EatingArea, cards))
	player.food_materials_changed.connect(func (cards): _on_card_deck_changed(%FoodMaterialArea, cards))
	player.decorations_changed.connect(func (cards): _on_card_deck_changed(%DecorationArea, cards))


func _process(_delta: float) -> void:
	%PlayerInfoContainer.visible = player.is_active
	%BankruptLabel.visible = !player.is_active
	%CoinNumberLabel.text = str(player.coins)
	%FoodMaterialCardNumberLabel.text = "食材 (%d)" % len(player.food_materials)


func _on_card_deck_changed(card_deck: Node, cards: Array) -> void:
	Utils.free_all_children(card_deck)
	for card in cards:
		var flat_card = FlatCard.instantiate()
		flat_card.card = card
		card_deck.add_child(flat_card)
