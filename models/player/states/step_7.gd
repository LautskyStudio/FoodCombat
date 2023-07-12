extends PlayerState


## 7. 以上步骤完成后，如果达成需求，该客人卡放入用餐区，如果未达成需求，该客人卡丢弃。


var customer: Customer

var is_fulfilled: bool


func enter(args := {}) -> void:
	customer = args['customer']
	assert(customer != null)
	is_fulfilled = args['is_fulfilled']

	if is_fulfilled:
		player.eating_area.append(customer)
		player.notify_eating_area_changed()
	else:
		player.game.discarded_customers.append(customer)

	state_machine.transit_to("Step8")
