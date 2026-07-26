extends Interactable_Class

func _ready() -> void:
	body_entered.connect(player_in)
	body_exited.connect(player_out)
	
func _physics_process(delta: float) -> void:
	pass

func player_in(body):
	super(body)
	print("player ada di portal")

func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0 :
		if Input.is_action_just_pressed("interact"):
			Global.from_room = "Coffin_room"
			SceneTransition.change_scene("res://TSCN/maps/Hallway.tscn")
