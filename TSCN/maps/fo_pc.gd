extends Interactable_Class
@onready var pc: PointLight2D = $"../light/PointLight2D2"
var already_played : bool = false
@onready var player: Player = $"../Player"

func _ready() -> void:
	pc.enabled = Boolvariable.fo_pc
	if !Boolvariable.fo_pc:
		already_played = true
	super()
	Global.puzzle2_done.connect(puzzle_done)

func player_in(body):
	super(body)
	
func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0 :
		if Input.is_action_just_pressed("interact"):
			if !already_played:
				play_game()
			else:
				Boolvariable.fo_pc = !Boolvariable.fo_pc
				pc.enabled = Boolvariable.fo_pc

func puzzle_done():
	already_played = true
	Boolvariable.fo_pc = !Boolvariable.fo_pc
	pc.enabled = Boolvariable.fo_pc
	$"../puzzle".get_child(0).queue_free()
	player.player_able_to_move = true

func play_game():
	player.player_able_to_move = false
	var scene = preload("res://TSCN/puzzle/control.tscn")
	var inst = scene.instantiate()
	$"../puzzle".add_child(inst)
