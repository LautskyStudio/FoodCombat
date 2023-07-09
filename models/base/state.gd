extends Node
class_name State


var state_machine: StateMachine


func _init() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED


func _enter(_args := {}) -> void:
	pass


func _exit() -> void:
	pass
