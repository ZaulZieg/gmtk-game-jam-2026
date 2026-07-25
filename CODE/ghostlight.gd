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
		if ghost_count.size() > 0 : Boolvariable.ghost_in_flashlight = true; Boolvariable.update_sanity()

func ghost_exited(area):
	if area is Ghosty:
		ghost_count.pop_back()
		if ghost_count.size() < 1:
			Boolvariable.ghost_in_flashlight = false ; Boolvariable.update_sanity()
