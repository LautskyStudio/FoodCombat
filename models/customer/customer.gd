extends Card
class_name Customer


@export var needs: Array[Need] = []
@export var events: Array[Event] = []


func _init(p_title := "", p_description := "", p_needs: Array[Need] = [], p_events: Array[Event] = []) -> void:
	title = p_title
	description = p_description
	needs = p_needs
	events = p_events


func can_be_fulfilled_by(materials: Array[FoodMaterial]) -> bool:
	return get_reward_for(materials) > 0


func get_reward_for(materials: Array[FoodMaterial]) -> int:
	for need in needs:
		if need.filter.call(materials):
			return need.reward
	return 0
