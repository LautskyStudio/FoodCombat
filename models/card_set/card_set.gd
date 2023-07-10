extends RefCounted
class_name CardSet


@export var food_materials: Array[FoodMaterial] = []
@export var customers: Array[Customer] = []
@export var decorations: Array[Decoration] = []


func _init() -> void:
	for food_material in FoodMaterials.get_property_list().map(func(x): return FoodMaterials.get(x.name)):
		if food_material is FoodMaterial:
			for i in range(randi_range(2, 6)):
				food_materials.append(food_material.duplicate())

	for customer in Customers.get_property_list().map(func(x): return Customers.get(x.name)):
		if customer is Customer:
			for i in range(randi_range(1, 3)):
				customers.append(customer.duplicate())

	for decoration in Decorations.get_property_list().map(func(x): return Decorations.get(x.name)):
		if decoration is Decoration:
			for i in range(randi_range(1, 2)):
				decorations.append(decoration.duplicate())
