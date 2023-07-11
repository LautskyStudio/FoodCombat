extends PlayerState


func enter(_args := {}) -> void:
	player.is_finishing_turn_allowed = false
