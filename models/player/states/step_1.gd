extends PlayerState


func _init() -> void:
	description = "抽取食材卡"


func enter(_args := {}) -> void:
	player.is_finishing_turn_allowed = false


func next_step() -> void:
	state_machine.transit_to("Step2")
