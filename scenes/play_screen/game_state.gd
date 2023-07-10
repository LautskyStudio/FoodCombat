extends State
class_name GameState


var play_screen: PlayScreen


func _ready() -> void:
	await owner.ready
	play_screen = owner as PlayScreen
	assert(play_screen != null)
