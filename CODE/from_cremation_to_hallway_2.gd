extends Interactable_Class

func _ready() -> void:
	super()

func player_in(body):
	super(body)
	
func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0 :
		if Input.is_action_just_pressed("interact"):
			Global.from_room = "Cremation_room"
			SceneTransition.change_scene("res://TSCN/maps/Hallway2.tscn")
