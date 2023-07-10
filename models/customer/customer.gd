extends BaseCard
class_name Customer


@export var needs: Array[Need] = []
@export var events: Array[Event] = []


func _init(p_needs: Array[Need], p_events: Array[Event]) -> void:
	needs = p_needs
	events = p_events
