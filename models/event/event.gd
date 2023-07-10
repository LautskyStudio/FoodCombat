extends Resource
class_name Event


@export var name := ""
@export var description := ""
@export var effect := func(_game: PlayScreen, _player: Player): pass


func _init(p_name: String, p_description: String, p_effect := func(_game: PlayScreen, _player: Player): pass) -> void:
	name = p_name
	description = p_description
	effect = p_effect
