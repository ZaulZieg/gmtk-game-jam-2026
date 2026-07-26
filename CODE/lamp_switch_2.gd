extends Area2D
@onready var point_light_2d: PointLight2D = $"../light/PointLight2D"
@onready var point_light_2d_2: PointLight2D = $"../light/PointLight2D2"
@onready var player: Player = $"../Player"

var detect : Array = []
func _ready() -> void:
	point_light_2d_2.enabled = Boolvariable.hallway1_light_right
	body_entered.connect(player_entered)
	body_exited.connect(player_exited)
	
func _process(delta: float) -> void:
	pass
	
func player_entered(body):
	if body is Player:
		Global.interactable_arr.append(body)
		detect.append(body)
		
func player_exited(body):
	if body is Player:
		Global.interactable_arr.pop_back()
		detect.pop_back()

func _input(event: InputEvent) -> void:
	if event and detect.size() > 0:
		if Input.is_action_just_pressed("interact"):
			Boolvariable.hallway1_light_right = !Boolvariable.hallway1_light_right
			await get_tree().process_frame
			point_light_2d_2.enabled = Boolvariable.hallway1_light_right
			
			#player.room_light_on = point_light_2d.enabled and point_light_2d_2.enabled
			Boolvariable.update_sanity()
