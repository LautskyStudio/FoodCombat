extends GameState


var winner: int


func enter(args := {}) -> void:
	winner = args['winner']
	if winner == 0:
		%WinerLabel.text = '您获胜了！'
	else:
		%WinerLabel.text = 'Good Game!'
	%EndingPoster.show()


func exit() -> void:
	%EndingPoster.hide()
