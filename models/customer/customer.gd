extends BaseCard
class_name Customer


@export var needs: Array[Need] = []
@export var events: Array[Event] = []


func _init(p_title := "", p_description := "", p_needs: Array[Need] = [], p_events: Array[Event] = []) -> void:
	title = p_title
	description = p_description
	needs = p_needs
	events = p_events
