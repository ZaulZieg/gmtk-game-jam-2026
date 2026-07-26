extends Interactable_Class

func _ready() -> void:
	super()

func player_in(body):
	super(body)
	print("player di to coffinroom")

func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0:
		if Input.is_action_just_pressed("interact"):
			Sfx.change_sound("door")
			SceneTransition.change_scene("res://TSCN/maps/coffin_room.tscn")
