extends Interactable_Class
@onready var point_light_2d: PointLight2D = $"../light/PointLight2D"
@onready var player: Player = $"../Player"

func _ready() -> void:
	point_light_2d.enabled = Boolvariable.female_toilet_light
	Global.puzzle_done.connect(puzzle_done)
	super()

func player_in(body):
	super(body)
	
func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0 :
		if Input.is_action_just_pressed("interact"):
			if !Boolvariable.female_toilet_light:
				Boolvariable.female_toilet_light = true
				point_light_2d.enabled = Boolvariable.female_toilet_light
			else:
				play_game()

func play_game():
	var scene = preload("res://TSCN/puzzle/switch_seq.tscn")
	var inst = scene.instantiate()
	player.player_able_to_move = false
	$"../CanvasLayer".add_child(inst)
	

func puzzle_done():
	Boolvariable.female_toilet_light = !Boolvariable.female_toilet_light
	$"../CanvasLayer".get_child(0).queue_free()
	point_light_2d.enabled = Boolvariable.female_toilet_light
	Boolvariable.update_sanity()
	player.player_able_to_move = true
