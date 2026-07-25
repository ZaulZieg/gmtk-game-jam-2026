extends Area2D
@onready var player: Player = $"../../Player"
@onready var point_light_2d: PointLight2D = $"../../LightManagement/PointLight2D"
@onready var point_light_2d_2: PointLight2D = $"../../LightManagement/PointLight2D2"



var detect : Array = []
func _ready() -> void:
	body_entered.connect(player_entered)
	body_exited.connect(player_exited)
	
func _process(delta: float) -> void:
	point_light_2d.enabled = Boolvariable.hallway2_light_left
	
	
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
			Boolvariable.hallway2_light_left = !Boolvariable.hallway2_light_left
			#player.room_light_on = point_light_2d.enabled or point_light_2d_2.enabled
			Boolvariable.update_sanity()
