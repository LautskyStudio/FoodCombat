@tool
extends Control

func _ready() -> void:
	%PlayerNumberSlider.set_value(Settings.player_number as float)
	%PlayerNumberLineEdit.text = "%d" % Settings.player_number


func _set_player_number(num: int) -> void:
	Settings.player_number = num
	%PlayerNumberLineEdit.text = "%d" % num


func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/play_screen.tscn")


func _on_player_number_slider_value_changed(value: float) -> void:
	_set_player_number(value as int)
