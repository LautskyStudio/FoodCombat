extends PlayerState


# 8. 重复步骤4~7，最多重复3次。


func enter(_args := {}) -> void:
	state_machine.transit_to("Step4")
