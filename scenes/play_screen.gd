@tool
extends Control
class_name PlayScreen


func _ready() -> void:
	if not Engine.is_editor_hint():
		Log.push("开始游戏。")
