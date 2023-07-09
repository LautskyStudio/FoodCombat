extends Node


signal logged(message: String)


var logs := []


func push(message: String) -> void:
	logs.push_back(message)
	logged.emit(message)
