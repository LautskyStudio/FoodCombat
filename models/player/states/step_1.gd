extends PlayerState


# 1. 从卡堆依次抽取1~3张食材卡，每抽取1张食材卡需要丢弃1张货币卡。


signal card_drawn(card: FoodMaterial)


func _init() -> void:
	description = "抽取食材卡"


func enter(_args := {}) -> void:
	player.is_finishing_turn_allowed = false


func next_step() -> void:
	state_machine.transit_to("Step2")


func draw_card() -> void:
	player.coins -= 1
	lose_when_bankrupts()

	var card = player.game.get_food_material_card()
	player.food_materials.append(card)
	player.notify_food_materials_changed()
	card_drawn.emit(card)


func lose_when_bankrupts() -> void:
	if player.is_lost:
		state_machine.transit_to('Inactive')
		player.finish_turn()
