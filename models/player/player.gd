extends Node
class_name Player


@export var player_name := '玩家'
@export var player_index := 0


var coins := 0

var waiting_area: Array[Customer] = []
