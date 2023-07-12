@tool
extends Node


var 五谷丰登 := Event.new(
	'五谷丰登',
	'场上的每一位玩家金币+2',
	func (game: PlayScreen, _player) -> void:
		for player in game.players:
			if player.is_active:
				player.coins += 2
		Log.push("五谷丰登：场上每位玩家金币 +2。")
)
