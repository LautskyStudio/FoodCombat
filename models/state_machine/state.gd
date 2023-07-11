extends Node
class_name State


signal state_entered
signal state_exited


var state_machine: StateMachine


func enter(_args := {}) -> void:
	pass


func exit() -> void:
	pass


func handle_input(_event: InputEvent) -> void:
	pass
