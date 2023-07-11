extends PlayerState


# 2. 可选择从卡堆依次抽取1~3张装扮卡，每抽取1张装扮卡需要丢弃1张货币卡。抽取装扮卡之后必须装备，如果自己场上存在相同类型装扮卡则替换，被替换的装扮卡丢弃。场上装扮卡效果到期则无效，一次性效果的装扮卡在发动效果则无效。


signal card_drawn(card: Decoration)


var turn := 0

var drawn_count := 0

var max_drawn_count := 3

var is_drawing_enabled: bool:
	get:
		return drawn_count < max_drawn_count


func _init() -> void:
	description = "抽取装扮卡"


func enter(_args := {}) -> void:
	if turn != player.game.turn:
		_reset()


func _reset() -> void:
	turn = player.game.turn
	drawn_count = 0


func next_step() -> void:
	state_machine.transit_to("Step3")


func draw_card() -> void:
	player.coins -= 1
	drawn_count += 1
	lose_when_bankrupts()

	var card = player.game.get_decoration_card()
	Log.push("%s 消费 1 金币抽取了 %s。" % [player.player_name, card.title])

	player.install_decoration_card(card)

	card_drawn.emit(card)
