extends Area2D
var detect : Array = []
func _ready() -> void:
	body_entered.connect(player_entered)
	body_exited.connect(player_exited)
	

func player_entered(body):
	if body is Player:
		Global.interactable_arr.append(body)
		detect.append(body)
		
func player_exited(body):
	if body is Player:
		Global.interactable_arr.pop_back()
		detect.pop_back()

func _input(event: InputEvent) -> void:
	if event and detect.size() > 0:
		if Input.is_action_just_pressed("interact"):
			Sfx.change_sound("door")
			Global.from_room = "Hallway_1"
			SceneTransition.change_scene("res://TSCN/maps/security_room.tscn")
