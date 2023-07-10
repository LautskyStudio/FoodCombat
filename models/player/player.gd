extends Node
class_name Player


@export var player_name := '玩家'
@export var player_index := 0


var coin := 0

var hand_cards: Array[Card] = []
var hand_cards_dict := {}
