extends Area2D

var ghost_count : Array = []
@onready var player: Player = $"../.."

func _ready() -> void:
	area_entered.connect(ghost_inside)
	area_exited.connect(ghost_exited)
	

func _physics_process(delta: float) -> void:
	#if ghost_count.size() > 0:
		#if player.timer.is_stopped():
			#player.timer.start()
	#else:
		#player.timer.stop()
	pass

func ghost_inside(area):
	if area is Ghosty:
		ghost_count.append(area)
		if ghost_count.size() > 0 : player.ghost_in_flashlight = true; player.update_sanity_timer()

func ghost_exited(area):
	if area is Ghosty:
		ghost_count.pop_back()
		if ghost_count.size() < 1:
			player.ghost_in_flashlight = false ; player.update_sanity_timer()
