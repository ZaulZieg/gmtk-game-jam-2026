extends Interactable_Class

@onready var point_light_2d: PointLight2D = $"../light/PointLight2D"

@onready var player: Player = $"../Player"

func _ready() -> void:
	point_light_2d.enabled = Boolvariable.cre_light
	super()

func player_in(body):
	super(body)
	
func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0 :
		if Input.is_action_just_pressed("interact"):
			Sfx.change_sound("lamp")
			Boolvariable.cre_light = !Boolvariable.cre_light
			point_light_2d.enabled = Boolvariable.cre_light
			Boolvariable.update_sanity()
