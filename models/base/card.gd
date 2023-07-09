@tool

extends Control
class_name Card

@export var title := ""
@export_multiline var description := ""

func _ready() -> void:
	%TitleLabel.text = title
	%DescriptionLabel.text = description
