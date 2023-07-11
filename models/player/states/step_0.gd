extends PlayerState


# 回合开始；部分特殊效果，如装扮卡等特殊效果生效的阶段。


func _init() -> void:
	description = "回合开始"


func enter(args := {}) -> void:
	super.enter(args)
	state_machine.transit_to("Step1")


func _reset() -> void:
	for decoration in player.decorations:
		decoration.effect.call(player.game, player, "turn_started", {})
