extends Node2D
@onready var player: Player = $Player

var timer = Timer
@onready var light: PointLight2D = $Player/Node2D/PointLight2D2


func _ready() -> void:
	var rand = randi_range(1,2)
	
	if rand == 2:
		$Area2D.visible = true
		$Area2D/CollisionShape2D.disabled = false
		Boolvariable.ghost_in_hallway1 = true
		Boolvariable.update_sanity()
	match Global.from_room:
		"Security_room":
			player.position = $Markers/from_security_room.global_position
		"Hallway_2":
			player.position = $Markers/from_hallway_2.global_position
			player.anim.animation = "walk_left"

func _process(delta: float) -> void:
	pass
	#print("sanity : ", Global.sanity)
	
func _exit_tree() -> void:
	#player.ghost_in_room = false
	#player.update_sanity_timer()
	pass
#func switch_light_off():
	#player.room_light_on = false
	#player.update_sanity_timer()
#
#func lights_on():
	#player.room_light_on = true
	#player.update_sanity_timer()
