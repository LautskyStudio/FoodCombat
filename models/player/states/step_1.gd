extends PlayerState


## 1. 从卡堆依次抽取1~3张食材卡，每抽取1张食材卡需要丢弃1张货币卡。


signal card_drawn(card: FoodMaterial)


var drawn_count := 0

var max_drawn_count := 3

var is_drawing_enabled: bool:
	get:
		return drawn_count < max_drawn_count


func _init() -> void:
	description = "抽取食材卡"


func enter(args := {}) -> void:
	super.enter(args)

	drawn_count = 0
	draw_card()


func next_step() -> void:
	state_machine.transit_to("Step2")


func draw_card() -> void:
	player.coins -= 1
	drawn_count += 1

	if bankrupts():
		return

	var card = player.game.get_food_material_card()
	player.food_materials.append(card)
	player.notify_food_materials_changed()
	card_drawn.emit(card)

	Log.push("%s 消费 1 金币抽取了 %s。" % [player.player_name, card.title])
