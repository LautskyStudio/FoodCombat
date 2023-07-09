extends GameState


func _enter(_args := {}) -> void:
	state_machine.transit_to('Running')
