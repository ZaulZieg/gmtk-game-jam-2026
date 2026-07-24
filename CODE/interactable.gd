extends StaticBody2D

@onready var area_2d: Area2D = $Area2D
var player_count : Array = []
@onready var interact_label : CanvasLayer = $"../Player/Node2D2/CanvasLayer"

func _ready() -> void:
	area_2d.body_entered.connect(player_entered)
	area_2d.body_exited.connect(player_exited)
	
func _process(delta: float) -> void:
	#Global.interactable_bool = player_count.size() > 0
	pass
	
	
func player_entered(body):
	if body:
		if body is CharacterBody2D:
			player_count.push_front(body)
			Global.interactable_arr.push_front(body)
func player_exited(body):
	if body:
		if body is CharacterBody2D:
			player_count.pop_back()
			Global.interactable_arr.pop_back()
func _input(event: InputEvent) -> void:
	if player_count.size() > 0:
		if event:
			if Input.is_action_just_pressed("interact"):
				print("SWITCH EMIT")
				Global.puzzle_switch1.emit()
				Global.pause_game()
				Global.inside_a_puzzle = true
