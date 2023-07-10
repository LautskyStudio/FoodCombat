extends Resource
class_name Need


@export var name := ""
@export var description := ""
@export var filter := func (_materials: Array[FoodMaterial]): return true
@export var reward := 0


func _init(p_name := "", p_description := "", p_filter := func(): pass, p_reward := 0) -> void:
	name = p_name
	description = p_description
	filter = p_filter
	reward = p_reward
