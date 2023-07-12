extends Button


signal player_selected(player: Player)


var _player: Player

var player: Player:
	get:
		return _player
	set(value):
		_player = value
		_update()


func _ready():
	_update()


func _update() -> void:
	if player:
		text = player.player_name


func _on_pressed() -> void:
	player_selected.emit(player)
