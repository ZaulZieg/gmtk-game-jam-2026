extends Area2D
var player_count : Array = []
func _ready() -> void:
	body_entered.connect(Player_entering)
	body_exited.connect(Player_exiting)
	
func Player_entering(body):
	if body is CharacterBody2D:
		Global.interactable_arr.append(body)
		player_count.append(body)
		
func Player_exiting(body):
	if body is CharacterBody2D:
		Global.interactable_arr.pop_back()
		player_count.pop_back()

func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0:
		if Input.is_action_just_pressed("interact"):
			Global.able_to_pause = false
			Global.pause_game()
			spawn_qn()

func spawn_qn():
	var node = preload("res://TSCN/Task Note.tscn")
	var inst = node.instantiate()
	get_parent().add_child(inst)
	
