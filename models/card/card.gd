@tool
extends VBoxContainer
class_name Card


signal card_selected(card: Card)


@export var title := ""
@export_multiline var description := ""

@export var is_selected: bool:
	set(value):
		_is_selected = value
		%IsSelectedCheckBox.button_pressed = value
	get:
		return _is_selected

@export var is_highlighted: bool:
	set(value):
		_is_highlighted = value
		%IsHighlightedCheckBox.button_pressed = value
	get:
		return _is_highlighted

var _is_selected := false
var _is_highlighted := false


func _ready() -> void:
	%TitleLabel.text = title
	%DescriptionLabel.text = description


func _on_select_button_pressed() -> void:
	card_selected.emit(self)
