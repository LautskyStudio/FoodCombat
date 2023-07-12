extends "res://scenes/play_screen/step_base.gd"


const PlayerButton = preload("res://scenes/play_screen/player_button.tscn")


var players: Array[Player]

var customer: Customer


func _ready() -> void:
	super._ready()
	state.customer_queued.connect(_update)
	state.all_customers_transferred.connect(hide)


func _on_show() -> void:
	_update()


func _update() -> void:
	_clear()

	%VisualCard.card = state.customer
	for player in state.available_targets:
		var button = PlayerButton.instantiate()
		button.player = player
		%TargetContainer.add_child(button)
		button.player_selected.connect(_on_player_selected)


func _clear() -> void:
	Utils.free_all_children(%TargetContainer)


func _on_hidden() -> void:
	_clear()


func _on_player_selected(player: Player) -> void:
	state.transfer_to(player)
