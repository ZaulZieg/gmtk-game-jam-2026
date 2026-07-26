extends Area2D
@onready var pc_1: PointLight2D = $"../../light/pclight/pc1"

var player_count : Array = []

func _ready() -> void:
	pc_1.enabled = Boolvariable.doc_room_pc1
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
			Sfx.change_sound("lamp")
			Boolvariable.doc_room_pc1 = !Boolvariable.doc_room_pc1
			await get_tree().process_frame
			pc_1.enabled = Boolvariable.doc_room_pc1
