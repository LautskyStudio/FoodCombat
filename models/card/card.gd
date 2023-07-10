extends Resource
class_name Card


@export var title := ""
@export_multiline var description := ""


static func random_card_from_collection(collection: Object) -> Card:
	var properties = collection.get_property_list().map(func (x): return collection.get(x.name))
	var cards: Array[Card] = []
	for property in properties:
		if property is Card:
			cards.append(property)
	return cards.pick_random()
