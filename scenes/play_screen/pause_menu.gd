extends Popup


func _ready() -> void:
	%ReturnToHomeScreenButton.connect("pressed", _return_to_home_screen)


func _return_to_home_screen() -> void:
	get_tree().change_scene_to_file("res://scenes/home_screen.tscn")
