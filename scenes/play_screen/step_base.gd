extends Control


@export var state_path := NodePath()

@onready var state: PlayerState = get_node(state_path)


func _ready() -> void:
	state.state_entered.connect(show)
	state.state_exited.connect(hide)
