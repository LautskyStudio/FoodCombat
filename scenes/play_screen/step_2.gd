extends "res://scenes/play_screen/step_base.gd"


const VisualCard = preload("res://models/card/visual_card.tscn")


func _ready() -> void:
	super._ready()
	state.card_drawn.connect(_on_card_drawn)


func _process(_delta: float) -> void:
	%DrawnCardNumberLabel.text = str(state.drawn_count)
	%DrawButton.disabled = !state.is_drawing_enabled


func _on_next_step_button_pressed() -> void:
	state.next_step()


func _on_draw_button_pressed() -> void:
	state.draw_card()


func _on_card_drawn(card) -> void:
	var visual_card = VisualCard.instantiate()
	visual_card.card = card
	visual_card.selectable = false
	%DrawnCardContainer.add_child(visual_card)


func _on_hidden() -> void:
	Utils.free_all_children(%DrawnCardContainer)
