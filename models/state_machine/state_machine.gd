extends Node
class_name StateMachine


signal transitioned(new_state: State, old_state: State)


@export var initial_state := NodePath()

@onready var state: State = get_node(initial_state)

@onready var active_state_name: String:
	get:
		return state.name


func _ready() -> void:
	await owner.ready
	for child in get_children():
		if child as State:
			child.state_machine = self
	state.enter()


func _input(event: InputEvent) -> void:
	state.handle_input(event)


func transit_to(state_name: String, args := {}):
	if (not has_node(state_name)) or not (get_node(state_name) as State):
		push_error("State {%s} is not a valid state." % state_name)

	var next_state: State = get_node(state_name)
	var old_state = state
	assert(next_state != null)

	state.exit()
	state.state_exited.emit()
	args['previous_state'] = state

	state = next_state
	state.enter(args)
	state.state_entered.emit()

	transitioned.emit(next_state, old_state)
