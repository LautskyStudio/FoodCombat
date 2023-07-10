extends BaseCard
class_name FoodMaterial


@export var category := ""


func _init(p_title := "", p_description := "", p_category := "") -> void:
	title = p_title
	description = p_description
	category = p_category
