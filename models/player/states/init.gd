extends PlayerState


func _init() -> void:
	description = "初始状态"


func enter(_args := {}) -> void:
	if player.player_index < Settings.player_number:
		state_machine.transit_to("Idle")
	else:
		state_machine.transit_to("Inactive")
