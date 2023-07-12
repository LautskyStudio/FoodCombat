extends PlayerState


## 3. 如果自己用餐区有客人卡，则把用餐区所有客人卡收入手牌。


func enter(args := {}) -> void:
	super.enter(args)

	if len(player.eating_area) > 0:
		player.helding_customers.append_array(player.eating_area)
		player.eating_area.clear()
		player.notify_eating_area_changed()

	state_machine.transit_to("Step4")
