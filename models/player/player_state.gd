extends State
class_name PlayerState


var player: Player

var description := ""

var turn := 0


func _ready() -> void:
	player = owner as Player
	assert(player != null)


func enter(_args := {}) -> void:
	if turn != player.game.turn:
		turn = player.game.turn
		_reset()


# 本回合初次进入此阶段时的效果
func _reset() -> void:
	pass


func lose_when_bankrupts() -> void:
	if player.is_lost:
		state_machine.transit_to('Inactive')
		Log.push("%s 破产了！" % [player.player_name])
		player.finish_turn()
