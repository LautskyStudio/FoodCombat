extends MarginContainer


const FlatCard = preload("res://models/card/flat_card.tscn")
const VisualCard = preload("res://models/card/visual_card.tscn")


signal cards_selected(cards: Array[FoodMaterial])


@export var player_path := NodePath()

var player := Player.new()

@onready var card_container = %FoodMaterialCardContainer

@onready var selected_cards: Array[FoodMaterial]:
	get:
		var selected: Array[FoodMaterial] = []
		for child in card_container.get_children():
			if child is VisualCard and child.is_selected:
				selected.append(child.card)
		return selected


func _ready() -> void:
	if player_path:
		if player:
			player.queue_free()
		player = get_node(player_path)

	player.waiting_area_changed.connect(func (cards): _on_card_deck_changed(%WaitingArea, cards, FlatCard))
	player.eating_area_changed.connect(func (cards): _on_card_deck_changed(%EatingArea, cards, FlatCard))
	player.food_materials_changed.connect(func (cards): _on_card_deck_changed(%FoodMaterialCardContainer, cards, VisualCard))
	player.decorations_changed.connect(func (cards): _on_card_deck_changed(%DecorationArea, cards, FlatCard))


func _process(_delta: float) -> void:
	%StateLabel.text = player.state.description
	%CoinNumberLabel.text = str(player.coins)
	%FoodMaterialCardNumberLabel.text = str(len(player.food_materials))
	%PlayerInfoContainer.visible = player.is_active
	%BankruptLabel.visible = !player.is_active


func _on_card_deck_changed(card_deck: Node, cards: Array, card_scene: PackedScene) -> void:
	Utils.free_all_children(card_deck)

	for card in cards:
		var card_view = card_scene.instantiate()
		card_view.card = card
		if card_view is VisualCard:
			card_view.card_selection_changed.connect(_on_card_selection_changed)
		card_deck.add_child(card_view)


func _on_card_selection_changed():
	cards_selected.emit(selected_cards)
