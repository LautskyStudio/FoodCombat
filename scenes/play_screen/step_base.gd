extends BoxContainer


@export var state_path := NodePath()

@onready var state: PlayerState = get_node(state_path)


func _ready() -> void:
	if state:
		state.state_entered.connect(func (): show(); _on_show())
		state.state_exited.connect(hide)


func _on_show() -> void:
	pass
