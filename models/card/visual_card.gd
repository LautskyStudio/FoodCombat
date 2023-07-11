@tool
extends VBoxContainer
class_name VisualCard


var card: Card

@export var selectable: bool = true

var _is_selected := false

@export var is_selected: bool:
	set(value):
		_is_selected = value
		%IsSelectedCheckBox.button_pressed = value
	get:
		return _is_selected


func _ready() -> void:
	if card:
		%TitleLabel.text = card.title
		%DescriptionLabel.text = card.description

	%SelectButton.visible = selectable
