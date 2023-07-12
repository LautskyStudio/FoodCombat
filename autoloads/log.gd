extends Node


signal logged(message: String)


func push(message: String) -> void:
	logged.emit(message)
