extends VBoxContainer


@export var player_path := NodePath()
var player := Player.new()

func _ready() -> void:
	if player_path:
		if player:
			player.queue_free()
		player = get_node(player_path)

	%PlayerNameLabel.text = player.player_name

	if player.player_index < Settings.player_number:
		show()
	else:
		hide()
