extends Resource
class_name Need


@export var name := ""
@export var description := ""
@export var filter := func (_materials: Array[FoodMaterial]): return true
@export var reward := 0


func _init(p_name: String, p_description: String, p_filter: Callable, p_reward: int) -> void:
	name = p_name
	description = p_description
	filter = p_filter
	reward = p_reward
