extends Node
class_name StateMachine


signal transitioned(state_name: String, state: State)


@export var initial_state := NodePath()
@onready var state: State = get_node(initial_state)


func _ready() -> void:
	await owner.ready
	for child in get_children():
		if child as State:
			child.state_machine = self
	state._enter()


func transit_to(state_name: String, args := {}):
	if (not has_node(state_name)) or not (get_node(state_name) as State):
		push_error("State {%s} is not a valid state." % state_name)
		return

	var next_state: State = get_node(state_name)
	state._exit()
	state.process_mode = Node.PROCESS_MODE_DISABLED
	state = next_state
	state._enter(args)
	state.process_mode = Node.PROCESS_MODE_ALWAYS

	transitioned.emit(state_name, state)
