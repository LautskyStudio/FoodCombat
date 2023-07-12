extends PlayerState


# 4. 如果自己的等候区有客人卡，按顺序翻开1张客人卡，否则从卡堆抽取1张客人卡并翻开。


var customer: Customer

var customer_received_at_this_turn := 0


func enter(args := {}) -> void:
	super.enter(args)

	if customer_received_at_this_turn >= 3 or len(player.food_materials) == 0:
		state_machine.transit_to('Step9')
		return

	customer = _get_customer()
	customer_received_at_this_turn += 1

	state_machine.transit_to("Step5", {'customer': customer})


func _on_first_enter_at_this_turn(_args := {}) -> void:
	customer_received_at_this_turn = 0


func _get_customer() -> Customer:
	if len(player.waiting_area) > 0:
		var next_customer = player.waiting_area.pop_front()
		player.notify_waiting_area_changed()
		return next_customer
	return player.game.remaining_customers.pop_back()
