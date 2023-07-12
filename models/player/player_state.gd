extends State
class_name PlayerState


var player: Player

var game: PlayScreen:
	get:
		return player.game

var description := ""

var turn := 0


func _ready() -> void:
	player = owner as Player
	assert(player != null)


func enter(_args := {}) -> void:
	if turn != player.game.turn:
		turn = player.game.turn
		_on_first_enter_at_this_turn(_args)


# 本回合初次进入此阶段时的效果
func _on_first_enter_at_this_turn(_args := {}) -> void:
	pass


func bankrupts() -> bool:
	if player.is_lost:
		state_machine.transit_to('Inactive')
		Log.push("%s 破产了！" % [player.player_name])
		player.finish_turn()
		return true

	return false
