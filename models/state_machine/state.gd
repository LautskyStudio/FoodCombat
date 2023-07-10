extends Node
class_name State


var state_machine: StateMachine


func _init() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED


func enter(_args := {}) -> void:
	pass


func exit() -> void:
	pass


func handle_input(_event: InputEvent) -> void:
	pass
