extends Interactable_Class
@onready var point_light_2d: PointLight2D = $"../../light/PointLight2D"

func _ready() -> void:
	point_light_2d.enabled = Boolvariable.cof_room_light
	body_entered.connect(player_in)
	body_exited.connect(player_out)
	
func _physics_process(delta: float) -> void:
	pass

func player_in(body):
	super(body)
	print("player sedang di lightswitch")
	
func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0 :
		if Input.is_action_just_pressed("interact"):
			Boolvariable.cof_room_light = !Boolvariable.cof_room_light
			point_light_2d.enabled = Boolvariable.cof_room_light
			Boolvariable.update_sanity()
