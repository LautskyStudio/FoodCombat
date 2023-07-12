extends PlayerState


# 9. 如果手中有客人卡，需要把手牌中客人卡转移到其他玩家等候区，
# 如果所有玩家的等候区都有三张客人卡，则丢弃手中剩余客人卡。


signal customer_queued
signal customer_transferred
signal all_customers_transferred


var customer: Customer

var active_players: Array[Player]:
	get:
		return game.players.filter(func (p): return p.is_active)

var available_targets: Array[Player]:
	get:
		return active_players.filter(func (p): return p != player and len(p.waiting_area) < 3)


func _init() -> void:
	description = "将手牌中的客人卡转移到其他玩家处"


func enter(_args := {}) -> void:
	while len(player.helding_customers) > 0:
		customer = player.helding_customers.pop_front()

		if _should_discard():
			game.discarded_customers.append(customer)
			continue

		customer_queued.emit()
		await customer_transferred

	all_customers_transferred.emit()
	state_machine.transit_to("Step10")


func transfer_to(target_player) -> void:
	target_player.waiting_area.append(customer)
	target_player.notify_waiting_area_changed()
	customer_transferred.emit()

	Log.push("%s 将 %s 转移到了 %s。" % [player.player_name, customer.title, target_player.player_name])


func _should_discard() -> bool:
	return len(available_targets) == 0
