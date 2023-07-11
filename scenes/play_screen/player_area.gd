extends VBoxContainer


const FlatCard = preload("res://models/card/flat_card.tscn")
const VisualCard = preload("res://models/card/visual_card.tscn")


@export var player_path := NodePath()
var player := Player.new()


func _ready() -> void:
	if player_path:
		if player:
			player.queue_free()
		player = get_node(player_path)

	player.waiting_area_changed.connect(func (cards): _on_card_deck_changed(%WaitingArea, cards, FlatCard))
	player.eating_area_changed.connect(func (cards): _on_card_deck_changed(%EatingArea, cards, FlatCard))
	player.food_materials_changed.connect(func (cards): _on_card_deck_changed(%FoodMaterialCardContainer, cards, VisualCard))


func _process(_delta: float) -> void:
	%StateLabel.text = player.state.description
	%CoinNumberLabel.text = str(player.coins)
	%FoodMaterialCardNumberLabel.text = str(len(player.food_materials))
	%EndTurnButton.disabled = !player.is_finishing_turn_allowed
	%PlayerInfoContainer.visible = player.is_active
	%BankruptLabel.visible = !player.is_active


func _on_card_deck_changed(card_deck: Node, cards: Array, card_scene: PackedScene) -> void:
	Utils.free_all_children(card_deck)
	for card in cards:
		var visual_card = card_scene.instantiate()
		visual_card.card = card
		card_deck.add_child(visual_card)
