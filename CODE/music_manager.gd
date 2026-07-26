extends Node2D
@onready var hall: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var secure: AudioStreamPlayer2D = $AudioStreamPlayer2D2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_hall_music():
	secure.stop()
	hall.play()

func play_secure_music():
	hall.stop()
	secure.play()
	
