extends Area2D

var player_inside : Array = []
@onready var interact_label : CanvasLayer = $"../Player/Node2D2/CanvasLayer"

func _ready() -> void:
	body_entered.connect(player_entered)
	body_exited.connect(player_exited)

func _process(delta: float) -> void:
	interact_label.visible = player_inside.size() > 0
	
	
func player_entered(body):
	if body is CharacterBody2D:
		player_inside.append(body)

func player_exited(body):
	if body is CharacterBody2D:
		player_inside.pop_back()
		
func _input(event: InputEvent) -> void:
	
	if event and player_inside.size() > 0:
		if Input.is_action_just_pressed("interact"):
			print("PC EMIT")
			Global.puzzle_pc1.emit()
			Global.pause_game()
			Global.inside_a_puzzle = true
		
