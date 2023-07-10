extends GameState


var previous_state: State = null


func _ready() -> void:
	super._ready()
	%PauseMenu.close_requested.connect(_on_pause_menu_hide)


func enter(args := {}) -> void:
	previous_state = args['previous_state'] as State
	assert(previous_state != null)

	%PauseMenu.popup_centered()
	get_tree().paused = true


func exit() -> void:
	get_tree().paused = false


func _exit_tree() -> void:
	get_tree().paused = false


func _on_pause_menu_hide() -> void:
	state_machine.transit_to(previous_state.name)
