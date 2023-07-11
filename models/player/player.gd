extends Node
class_name Player


signal turn_begun
signal turn_finished
signal state_changed(new_state: PlayerState, old_state: PlayerState)
signal is_finishing_turn_allowed_changed(value: bool)
signal waiting_area_changed(cards: Array[Customer])
signal eating_area_changed(cards: Array[Customer])
signal food_materials_changed(cards: Array[FoodMaterial])


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

var _is_finishing_turn_allowed: bool

var is_finishing_turn_allowed: bool:
	get:
		return _is_finishing_turn_allowed
	set(value):
		_is_finishing_turn_allowed = value
		is_finishing_turn_allowed_changed.emit(value)


func begin_turn() -> void:
	Log.push('%s 回合开始。' % player_name)
	if state.name == 'Idle':
		state_machine.transit_to('Step1')
		turn_begun.emit()


func finish_turn() -> void:
	Log.push('%s 回合结束。' % player_name)
	turn_finished.emit()


func notify_waiting_area_changed() -> void:
	waiting_area_changed.emit(waiting_area)


func notify_eating_area_changed() -> void:
	eating_area_changed.emit(eating_area)


func notify_food_materials_changed() -> void:
	food_materials_changed.emit(food_materials)


func _on_state_machine_transitioned(new_state, old_state) -> void:
	state_changed.emit(new_state as PlayerState, old_state as PlayerState)
