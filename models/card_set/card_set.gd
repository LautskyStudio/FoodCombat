extends RefCounted
class_name CardSet


@export var food_materials: Array[FoodMaterial] = []
@export var customers: Array[Customer] = []
@export var decorations: Array[Decoration] = []


func _init() -> void:
	while len(food_materials) < Settings.player_number * Settings.player_number * 2 + 10:
		_generate_cards()


func _generate_cards() -> void:
	for food_material in _get_object_properties(FoodMaterials):
		if food_material is FoodMaterial:
			for i in range(randi_range(2, 6)):
				food_materials.append(food_material.duplicate())

	for customer in _get_object_properties(Customers):
		if customer is Customer:
			for i in range(randi_range(6, 8)):
				customers.append(customer.duplicate())

	for decoration in _get_object_properties(Decorations):
		if decoration is Decoration:
			for i in range(randi_range(1, 2)):
				decorations.append(decoration.duplicate())

	food_materials.shuffle()
	customers.shuffle()
	decorations.shuffle()


func _get_object_properties(object: Object) -> Array:
	return object.get_property_list().map(func(x): return object.get(x.name))
