extends Area2D
class_name Interactable_Class
@onready var player_count : Array = []

func _ready() -> void:
	body_entered.connect(player_in)
	body_exited.connect(player_out)
	
func player_in(body):
	if body is Player:
		player_count.append(body)
		Global.interactable_arr.append(body)
func player_out(body):
	if body is Player:
		player_count.pop_back()
		Global.interactable_arr.pop_back()
