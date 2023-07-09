@tool
extends VBoxContainer


@export var player_name := "玩家"


func _ready() -> void:
	%PlayerNameLabel.text = player_name
