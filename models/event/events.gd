@tool
extends Node

var 五谷丰登 := Event.new(
	'五谷丰登',
	'场上的每一位玩家金币+2')

var event_list: Array[Event] = []

var event_dict := {}


func _ready() -> void:
	var properties = get_property_list().map(func(x): return get(x.name))
	for property in properties:
		if property is Event:
			event_list.append(property)

	for event in event_list:
		event_dict[event.name] = event
	notify_property_list_changed()


func _get_property_list() -> Array[Dictionary]:
	var properties: Array[Dictionary] = []

	for event in event_list:
		properties.append({
			"name": event.name,
			"type": TYPE_OBJECT,
			"hint": PROPERTY_HINT_RESOURCE_TYPE
		})
	return properties


func _get(property: StringName) -> Variant:
	if event_dict.has(property):
		return event_dict[property]
	return null
