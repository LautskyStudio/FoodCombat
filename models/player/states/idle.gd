extends PlayerState


func _init() -> void:
	description = "正在等待其他玩家"


func enter(_args := {}) -> void:
	player.is_finishing_turn_allowed = false
