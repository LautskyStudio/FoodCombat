extends PlayerState


# 4. 如果自己的等候区有客人卡，按顺序翻开1张客人卡，否则从卡堆抽取1张客人卡并翻开。


var customer: Customer


func enter(args := {}) -> void:
	if len(player.food_materials) == 0:
		state_machine.transit_to('Step9')
		return

	super.enter(args)


func _reset() -> void:
	customer = _get_customer()


func _get_customer() -> Customer:
	if len(player.waiting_area) > 0:
		return player.waiting_area.pop_front()
	return player.game.remaining_customers.pop_back()


func submit(materials: Array[FoodMaterial]) -> void:
	if customer.can_be_fulfilled_by(materials):
		var reward = customer.get_reward_for(materials)
		player.coins += reward
		Log.push("%s 为 %s 制作出了美食，获得了 %d 金币。" % [player.player_name, customer.title, reward])
	discard(materials)


func discard(materials: Array[FoodMaterial]) -> void:
	for item in materials:
		var idx = player.food_materials.find(item)
		player.food_materials.remove_at(idx)
		player.game.discarded_food_materials.append(item)
	state_machine.transit_to("Step5")
