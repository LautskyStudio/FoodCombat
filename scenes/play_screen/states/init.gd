extends GameState


func enter(_args := {}) -> void:
	state_machine.transit_to('Running')
