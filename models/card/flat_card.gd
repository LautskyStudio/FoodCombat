extends Label
class_name FlatCard


@export var card: Card:
	set(val):
		_card = val
		if _card:
			text = _card.title
			tooltip_text = _card.description
	get:
		return _card

var _card: Card


func _ready() -> void:
	if card == null:
		card = Card.random_card_from_collection(Customers)
