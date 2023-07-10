extends BaseCard
class_name Decoration


@export var kind := ''
@export var duration := 0
@export var effect := func (_game: PlayScreen, _player: Player, _when: String, _args: Dictionary): pass

var installed_turn := 0


func _init(p_title: String, p_description: String, p_kind: String, p_duration: int, p_effect: Callable) -> void:
	title = p_title
	description = p_description
	kind = p_kind
	duration = p_duration
	effect = p_effect
