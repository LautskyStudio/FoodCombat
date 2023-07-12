extends PlayerState


# 5.
# 此客人卡上写有需求，可以根据食材卡标签食自由组合使其达成需求并丢弃，然后获取需求上写的等额货币。
# 如果无法达成需求，则不能获得货币，且则需要丢弃任意可作为料理的组合或单独的食材卡。


var customer: Customer


func enter(args := {}) -> void:
	super.enter(args)
	customer = args['customer']
	assert(customer != null)


func submit(materials: Array[FoodMaterial]) -> void:
	if customer.can_be_fulfilled_by(materials):
		var reward = customer.get_reward_for(materials)
		player.coins += reward
		Log.push("%s 为 %s 制作出了美食，获得了 %d 金币。" % [player.player_name, customer.title, reward])
		state_machine.transit_to("Step6", {'customer': customer, 'is_fulfilled': true})
	_discard(materials)


func discard(materials: Array[FoodMaterial]) -> void:
	Log.push('%s 放弃为 %s 制作美食。' % [player.player_name, customer.title])
	_discard(materials)
	state_machine.transit_to("Step6", {'customer': customer, 'is_fulfilled': false})


func _discard(materials: Array[FoodMaterial]) -> void:
	for item in materials:
		var idx = player.food_materials.find(item)
		player.food_materials.remove_at(idx)
		player.game.discarded_food_materials.append(item)
		player.notify_food_materials_changed()
