extends PlayerState


# 6. 步骤2结束后，如果客人卡写有事件，则需要根据事件内容执行相应动作。


var customer: Customer


func enter(args := {}) -> void:
	super.enter(args)
	customer = args['customer']
	assert(customer != null)
