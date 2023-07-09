extends GameState


func _enter(args := {}) -> void:
	super._enter(args)
	%PauseMenu.close_requested.connect(_on_pause_menu_hide)
	%PauseMenu.popup_centered()
	get_tree().paused = true


func _exit() -> void:
	super._exit()
	%PauseMenu.close_requested.disconnect(_on_pause_menu_hide)
	get_tree().paused = false


func _on_pause_menu_hide() -> void:
	state_machine.transit_to("Running")
