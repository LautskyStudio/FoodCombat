@tool
extends VBoxContainer
class_name VisualCard


signal card_selection_changed


var _card: Card

var card: Card:
	get:
		return _card
	set(value):
		_card = value
		_update()

@export var selectable: bool = true

var _is_selected := false

@export var is_selected: bool:
	set(value):
		_is_selected = value
		%SelectButton.button_pressed = value
		card_selection_changed.emit()
	get:
		return _is_selected


func _ready() -> void:
	_update()


func _update() -> void:
	if is_inside_tree():
		if card:
			%TitleLabel.text = card.title
			%DescriptionLabel.text = card.description
	%SelectButton.visible = selectable


func _on_select_button_toggled(button_pressed: bool) -> void:
	is_selected = button_pressed
