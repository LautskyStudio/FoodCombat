extends PlayerState


## 6. 步骤5结束后，如果客人卡写有事件，则需要根据事件内容执行相应动作。


var customer: Customer

var is_fulfilled: bool


func enter(args := {}) -> void:
	super.enter(args)

	customer = args['customer']
	assert(customer != null)
	is_fulfilled = args['is_fulfilled']

	if is_fulfilled:
		for event in customer.events:
			event.effect.call(player.game, player)

		for decoration in player.decorations:
			decoration.effect.call(game, player, 'customer_succeeded', {})

	state_machine.transit_to("Step7", args)
