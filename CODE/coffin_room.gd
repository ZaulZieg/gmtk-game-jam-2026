extends Node2D
@onready var ghost: Ghosty = $Ghost


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Boolvariable.update_sanity()
	var rand = randi_range(1,2)
	if rand == 2:
		Boolvariable.cof_ghost_in_room = true
		Boolvariable.update_sanity()
	ghost.visible = Boolvariable.cof_ghost_in_room
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
