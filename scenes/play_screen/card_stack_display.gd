@tool
extends GridContainer
class_name CardStackDisplay


func set_numbers(food_materials: int, customers: int, decorations: int) -> void:
	%FoodMaterialCardCountLabel.text = str(food_materials)
	%CustomerCardCountLabel.text = str(customers)
	%DecorationCardCountLabel.text = str(decorations)
