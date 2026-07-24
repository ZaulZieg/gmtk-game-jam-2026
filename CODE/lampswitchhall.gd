extends Area2D
@onready var point_light_2d: PointLight2D = $"../light/PointLight2D"
@onready var point_light_2d_2: PointLight2D = $"../light/PointLight2D2"
@onready var player: Player = $"../Player"

var detect : Array = []
func _ready() -> void:
	body_entered.connect(player_entered)
	body_exited.connect(player_exited)
	

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
			point_light_2d.enabled = !point_light_2d.enabled
			point_light_2d_2.enabled = !point_light_2d_2.enabled
			if point_light_2d.enabled == true:
				player.room_light_on = true
				player.update_sanity_timer()
			else:
				player.room_light_on = false
				player.update_sanity_timer()
