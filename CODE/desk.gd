extends StaticBody2D

@onready var player_count : Array = []
@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:
	$Area2D.body_entered.connect(player_inside)
	$Area2D.body_exited.connect(player_exited)

func _physics_process(delta: float) -> void:
	if player_count.size() > 0 :
		player.z_index = 1
	else: player.z_index = 0

func player_inside(body):
	if body is CharacterBody2D:
		player_count.append(body)
		
func player_exited(body):
	if body is CharacterBody2D:
		player_count.pop_back()
