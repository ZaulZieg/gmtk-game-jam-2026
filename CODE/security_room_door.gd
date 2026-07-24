extends Area2D

func _ready() -> void:
	body_entered.connect(Player_entering)
	body_exited.connect(Player_exiting)
	
func Player_entering(body):
	if body is CharacterBody2D:
		Global.interactable_arr.append(body)
func Player_exiting(body):
	if body is CharacterBody2D:
		Global.interactable_arr.pop_back()
