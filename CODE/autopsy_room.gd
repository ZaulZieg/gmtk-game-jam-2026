extends Node2D
@onready var player: Player = $Player
@onready var ghosty: Ghosty = $Ghosty


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ran = randi_range(1,4)
	if ran == 1 :
		Boolvariable.aut_ghost = true
	ghosty.visible = Boolvariable.aut_light
	Boolvariable.update_sanity()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
