extends Node
class_name Player


signal turn_begun
signal turn_finished
signal state_changed(new_state: PlayerState, old_state: PlayerState)
signal is_finishing_turn_allowed_changed(value: bool)
signal waiting_area_changed(cards: Array[Customer])
signal eating_area_changed(cards: Array[Customer])
signal food_materials_changed(cards: Array[FoodMaterial])
signal decorations_changed(cards: Array[Decoration])


@export var player_name := '玩家'

@export var player_index := 0

@onready var game: PlayScreen

@onready var is_active: bool:
	get:
		return $StateMachine.state != $StateMachine/Inactive

var is_bot: bool:
	get:
		return player_index > 0

@onready var state_machine: StateMachine = $StateMachine

@onready var state: PlayerState:
	get:
		return $StateMachine.state as PlayerState

var coins := 0

var is_lost: bool:
	get:
		return coins < 0

var waiting_area: Array[Customer] = []

var eating_area: Array[Customer] = []

var food_materials: Array[FoodMaterial] = []

var decorations: Array[Decoration] = []

var _is_finishing_turn_allowed: bool

var is_finishing_turn_allowed: bool:
	get:
		return _is_finishing_turn_allowed
	set(value):
		_is_finishing_turn_allowed = value
		is_finishing_turn_allowed_changed.emit(value)


func begin_turn() -> void:
	if state.name == 'Idle':
		Log.push('%s 回合开始。' % player_name)
		state_machine.transit_to('Step1')
		turn_begun.emit()


func finish_turn() -> void:
	Log.push('%s 回合结束。' % player_name)
	turn_finished.emit()


func install_decoration_card(card: Decoration) -> void:
	var same_kind_decorations = decorations.filter(func (d): return d.kind == card.kind)

	if len(same_kind_decorations) > 0:
		var idx = decorations.find(same_kind_decorations[0])
		var old_card = decorations[idx]
		decorations[idx] = card
		game.discarded_decorations.append(old_card)

		Log.push("%s 使用装扮 %s 替换了 %s。" % [player_name, card.title, old_card.title])
	else:
		decorations.append(card)
		if len(decorations) > 3:
			decorations.pop_front()

		Log.push("%s 安装了装扮 %s。" % [player_name, card.title])

	_notify_decorations_changed()


func notify_waiting_area_changed() -> void:
	waiting_area_changed.emit(waiting_area)


func notify_eating_area_changed() -> void:
	eating_area_changed.emit(eating_area)


func notify_food_materials_changed() -> void:
	food_materials_changed.emit(food_materials)


func _notify_decorations_changed() -> void:
	decorations_changed.emit(decorations)


func _on_state_machine_transitioned(new_state, old_state) -> void:
	state_changed.emit(new_state as PlayerState, old_state as PlayerState)
