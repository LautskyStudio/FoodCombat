extends GameState


var winner: int


func enter(args := {}) -> void:
	winner = args['winner']

	var winner_label = play_screen.get_node('%EndingPoster/WinerLabel')
	var poster = play_screen.get_node("%EndingPoster")

	if winner == 0:
		winner_label.text = '您获胜了！'
	else:
		winner_label.text = 'Good Game!'
	poster.show()


func exit() -> void:
	play_screen.get_node("%EndingPoster").hide()
