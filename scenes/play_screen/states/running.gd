extends GameState


var current_player: Player


func enter(args := {}) -> void:
	if args['previous_state'].name == 'Init':
		run_game()


func run_game() -> void:
	while true:
		if current_player == null:
			game.begin_next_turn()
			current_player = game.players[0]
		else:
			var winner = _find_winner()
			if winner != -1:
				state_machine.transit_to('End', {'winner': winner})
				return

			current_player.begin_turn()
			if current_player.is_bot:
				%BotActionTimer.start()

			if current_player.is_active:
				await current_player.turn_finished

			if current_player.is_bot:
				%BotActionTimer.stop()

			current_player = _find_next_player()


func _find_next_player() -> Player:
	var next_player_index = game.players.find(current_player) + 1
	while next_player_index < len(game.players):
		var next_player = game.players[next_player_index]
		if next_player.is_active:
			return next_player
		next_player_index += 1
	return null


## 寻找游戏的获胜者
## 返回获胜者的 player_index；-1 表示没有获胜者（游戏还在进行）。
func _find_winner() -> int:
	var active_player_count := len(game.players.filter(func (p): return p.is_active))
	var active_player_index := 0

	if active_player_count <= 1:
		return active_player_index
	else:
		return -1


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("game_pause"):
		state_machine.transit_to("Pause")


func _on_pause_button_pressed() -> void:
	state_machine.transit_to("Pause")


func _on_bot_action_timer_timeout() -> void:
	if current_player.is_bot:
		var player = current_player
		var state = player.state

		match state.name:
			"Init", "Idle", "Inactive":
				pass

			"Step1":
				if state.is_drawing_enabled:
					state.draw_card()
				else:
					state.next_step()

			"Step2":
				if state.is_drawing_enabled:
					state.draw_card()
				else:
					state.next_step()

			"Step3", "Step4":
				pass

			"Step5":
				var materials = player.food_materials
				if state.customer.can_be_fulfilled_by(materials):
					state.submit(materials)
				else:
					state.discard(materials)

			"Step6", "Step7", "Step8":
				pass

			"Step9":
				state.transfer_to(state.available_targets[0])

			"Step10":
				pass

			var unknown_state:
				push_error("未知状态：%s。" % unknown_state)
