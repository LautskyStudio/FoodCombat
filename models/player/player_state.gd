extends State
class_name PlayerState


var player: Player

var description := ""


func _ready() -> void:
	player = owner as Player
	assert(player != null)


func lose_when_bankrupts() -> void:
	if player.is_lost:
		state_machine.transit_to('Inactive')
		Log.push("%s 破产了！" % [player.player_name])
		player.finish_turn()
