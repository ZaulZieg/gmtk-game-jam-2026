extends Node

signal puzzle_switch1
signal puzzle_pc1
signal puzzle_up
signal puzzle_down

@onready var game_on_pause : bool = false
@onready var Player_sanity : int = 0

@onready var inside_a_puzzle : bool = false :
	set(value):
		inside_a_puzzle = value
		if inside_a_puzzle:
			puzzle_up.emit()
		else:
			puzzle_down.emit()
			unpause_game()
			
@onready var time_left : Timer



func pause_game():
	get_tree().paused = true
	
	
func unpause_game():
	get_tree().paused = false
