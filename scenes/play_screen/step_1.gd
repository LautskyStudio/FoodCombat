extends VBoxContainer


var state: PlayerState


func _on_next_step_button_pressed() -> void:
	state.next_step()


func _on_draw_button_pressed() -> void:
	state.draw_card()
