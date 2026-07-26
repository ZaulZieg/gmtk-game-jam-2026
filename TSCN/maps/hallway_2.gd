extends Node2D
@onready var player: Player = $Player

func _ready() -> void:
	match Global.from_room:
		"Cremation_room":
			player.position = $locator/cremation_room.global_position
			player.anim.animation = "walk_down"
		"fo":
			player.position = $locator/FO.global_position
			player.anim.animation = "walk_up"
		"Autopsy_room":
			player.position = $locator/Autopsy_room.global_position
			player.anim.animation = "walk_down"
