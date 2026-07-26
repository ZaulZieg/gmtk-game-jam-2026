extends Interactable_Class
@onready var point_light_2d: PointLight2D = $"../light/PointLight2D"
@onready var ghosty: Ghosty = $"../Ghosty"
@onready var player: Player = $"../Player"

func _ready() -> void:
	super()
	update_light()
	Global.puzzle_done.connect(puzzle_done)
	update_ghost_visibility()

func player_in(body):
	super(body)
	
func _input(event: InputEvent) -> void:
	if event and player_count.size() > 0 :
		if Input.is_action_just_pressed("interact"):
			if !Boolvariable.fo_light:
				Boolvariable.fo_light = true
				update_light()
			else:
				play_game()
			#await get_tree().create_timer(0.3).timeout
			Boolvariable.update_sanity()
			update_ghost_visibility()

func play_game():
	var scene = preload("res://TSCN/puzzle/switch_seq.tscn")
	var inst = scene.instantiate()
	player.player_able_to_move = false
	$"../puzzle".add_child(inst)
	
func puzzle_done():
	Boolvariable.fo_light = !Boolvariable.fo_light
	$"../puzzle".get_child(0).queue_free()
	call_deferred("conti")

func conti():
	update_light()
	Boolvariable.update_sanity()
	player.player_able_to_move = true
	update_ghost_visibility()

func update_ghost_visibility():
	ghosty.visible = Boolvariable.fo_ghost
func update_light():
	point_light_2d.enabled = Boolvariable.fo_light
