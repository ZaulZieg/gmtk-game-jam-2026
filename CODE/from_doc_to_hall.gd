extends Area2D

var player_count : Array = []

func _ready() -> void:
	body_entered.connect(player_in)
	body_exited.connect(player_out)

func player_in(body):
	if body is Player:
		player_count.append(body)
		Global.interactable_arr.append(body)
func player_out(body):
	if body is Player:
		player_count.pop_front()
		Global.interactable_arr.pop_back()
		
func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0:
		if event.is_action_pressed("interact"):
			Sfx.change_sound("door")
			Global.from_room = "Document_room"
			SceneTransition.change_scene("res://TSCN/maps/Hallway.tscn")
