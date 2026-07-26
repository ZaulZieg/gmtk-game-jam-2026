extends Interactable_Class
@onready var player: Player = $"../Player"
@onready var point_light_2d: PointLight2D = $"../light/PointLight2D"

func _ready() -> void:
	point_light_2d.enabled = Boolvariable.aut_light
	super()

func player_in(body):
	super(body)
	
func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0 :
		if Input.is_action_just_pressed("interact"):
			Boolvariable.aut_light = !Boolvariable.aut_light
			point_light_2d.enabled = Boolvariable.aut_light
			Boolvariable.update_sanity()
