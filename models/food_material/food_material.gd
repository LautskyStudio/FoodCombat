extends BaseCard
class_name FoodMaterial


@export var name := ""
@export var category := ""


func _init(p_name: String, p_category: String) -> void:
	name = p_name
	category = p_category
