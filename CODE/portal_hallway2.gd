extends Node2D
@onready var hallway_1: Area2D = $back_to_hallway1

func _ready() -> void:
	hallway_1.body_entered.connect(to_the_hallway_1)
	
func to_the_hallway_1(body):
	if body is Player:
		SceneTransition.change_scene("res://TSCN/maps/Hallway.tscn")
