extends Resource
class_name Event


@export var name := ""
@export var description := ""
@export var effect := func(owner, player): pass


func _init(p_name: String, p_description: String, p_effect := func(owner, player): pass) -> void:
	name = p_name
	description = p_description
	effect = p_effect
