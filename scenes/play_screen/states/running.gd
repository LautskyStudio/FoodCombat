extends GameState


func enter(_args := {}) -> void:
	if game.turn == 0:
		Log.push("游戏阶段")
		game.begin_next_turn()


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("game_pause"):
		state_machine.transit_to("Pause")


func _on_pause_button_pressed() -> void:
	state_machine.transit_to("Pause")
