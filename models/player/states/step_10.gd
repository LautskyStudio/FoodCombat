extends PlayerState


# 回合结束，部分特殊效果发动。


func _init() -> void:
	description = "结束"


func enter(_args := {}) -> void:
	if bankrupts():
		return

	player.finish_turn()
	state_machine.transit_to("Idle")
