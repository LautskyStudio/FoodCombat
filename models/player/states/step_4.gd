extends PlayerState


# 4. 如果自己的等候区有客人卡，按顺序翻开1张客人卡，否则从卡堆抽取1张客人卡并翻开。


var customer: Customer


func enter(args := {}) -> void:
	super.enter(args)


func _reset() -> void:
	customer = _get_customer()


func _get_customer() -> Customer:
	if len(player.waiting_area) > 0:
		return player.waiting_area.pop_front()
	return player.game.remaining_customers.pop_back()
