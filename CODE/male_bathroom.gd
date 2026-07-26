extends Node2D
@onready var ghost: Ghosty = $ghost


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ghost.visible = Boolvariable.male_toilet_light
	var ran = randi_range(1,4)
	if ran == 1 :
		Boolvariable.male_toilet_ghost = true
		
	ghost.visible = Boolvariable.male_toilet_ghost
	Boolvariable.update_sanity()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
