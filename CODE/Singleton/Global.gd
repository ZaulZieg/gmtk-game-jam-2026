extends Node

signal puzzle_switch1
signal puzzle_pc1
signal puzzle_up
signal puzzle_down
signal interactable(is_on : bool)
signal puzzle_done
signal puzzle2_done
signal dialog_closed
#signal note_closed


@onready var ghost_in_the_room : bool = false

var from_room : String = ""

@onready var ghost_count : Array = []

@onready var sanity : int = 100 : 
	set(value):
		sanity = value
		print("sanity : ", sanity)

@onready var game_on_pause : bool = false
@onready var Player_sanity : int = 0
@onready var interactable_bool : bool = false
@onready var interactable_arr : Array = []
@onready var able_to_pause : bool = true
@onready var player_in_room : String = ""

@onready var inside_a_puzzle : bool = false :
	set(value):
		inside_a_puzzle = value
		if inside_a_puzzle:
			puzzle_up.emit()
		else:
			puzzle_down.emit()
			unpause_game()
			
@onready var time_left : Timer

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	pass

func note_closed():
	await get_tree().create_timer(1.0).timeout
	able_to_pause = true
func pause_game():
	get_tree().paused = true
	
	
func unpause_game():
	get_tree().paused = false
