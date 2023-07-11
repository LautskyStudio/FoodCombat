extends State
class_name PlayerState


var player: Player

var description := ""


func _ready() -> void:
	player = owner as Player
	assert(player != null)
