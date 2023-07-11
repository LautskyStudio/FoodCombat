extends PlayerState


func _init() -> void:
	description = "胜负已分"


func enter(_args := {}) -> void:
	player.is_finishing_turn_allowed = false
