extends GameState


# 初始阶段
# 初始化卡牌
# 为每个玩家派发初始金币和卡牌


func enter(_args := {}) -> void:
	Log.push("初始阶段")

	init_game()
	init_coins_and_cards()
	state_machine.transit_to('Running')


func init_game() -> void:
	game.turn = 0


func init_coins_and_cards() -> void:
	var initial_coins = Settings.player_number * 2

	Log.push("本局游戏共有 %d 名玩家，每名玩家初始金币数量为 %d。" % [Settings.player_number, initial_coins])
	Log.push("游戏目标为死亡竞赛。（>_<）为什么美食争霸要打死亡竞赛啊喂？")
