@tool
extends Control

func _ready() -> void:
	%PlayerNumberSlider.set_value(Settings.player_number as float)
	%PlayerNumberLineEdit.text = "%d" % Settings.player_number

	%PlayerNumberSlider.connect("value_changed", func (val): _set_player_number(val as int))
	%StartGameButton.connect("pressed", _goto_play_screen)

func _set_player_number(num: int) -> void:
	Settings.player_number = num
	%PlayerNumberLineEdit.text = "%d" % num

func _goto_play_screen() -> void:
	get_tree().change_scene_to_file("res://scenes/play_screen.tscn")
