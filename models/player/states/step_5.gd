extends PlayerState


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
	_discard(materials)


func discard(materials: Array[FoodMaterial]) -> void:
	Log.push('%s 放弃为 %s 制作美食。' % [player.player_name, customer.title])
	_discard(materials)


func _discard(materials: Array[FoodMaterial]) -> void:
	for item in materials:
		var idx = player.food_materials.find(item)
		player.food_materials.remove_at(idx)
		player.game.discarded_food_materials.append(item)
		player.notify_food_materials_changed()
	state_machine.transit_to("Step6", {'customer': customer})
