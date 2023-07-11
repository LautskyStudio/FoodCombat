extends GameState


# 初始阶段
# 初始化卡牌
# 为每个玩家派发初始金币和卡牌


func enter(_args := {}) -> void:
	Log.push("初始阶段")

	_init_players()
	_init_game()
	_init_coins_and_cards()
	state_machine.transit_to('Running')


func _init_players() -> void:
	Log.push("本局游戏共有 %d 名玩家。" % Settings.player_number)


func _init_game() -> void:
	game.turn = 0

	var card_set = CardSet.new()
	game.remaining_cards['food_materials'] = card_set.food_materials
	game.remaining_cards['customers'] = card_set.customers
	game.remaining_cards['decorations'] = card_set.decorations

	Log.push('卡组中有食材卡 %d 张、顾客卡 %d 张、装扮卡 %d 张。' % [
		len(card_set.food_materials),
		len(card_set.customers),
		len(card_set.decorations),
	])


func _init_coins_and_cards() -> void:
	var initial_coins = Settings.player_number * 2
	for player in game.players:
		if player.is_active:
			player.coins = initial_coins

			for i in range(3):
				player.waiting_area.append(game.get_customer_card())
			player.notify_waiting_area_changed()

			for i in range(Settings.player_number * 2):
				player.food_materials.append(game.get_food_material_card())
			player.notify_food_materials_changed()

	Log.push("每名玩家初始金币数量为 %d。" % [initial_coins])
	Log.push("游戏目标为死亡竞赛。（>_<）为什么美食争霸要打死亡竞赛啊喂？")
