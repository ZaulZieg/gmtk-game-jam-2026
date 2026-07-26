extends AudioStreamPlayer2D
 
var sounds : Dictionary = {
	"door":"res://ASS/sounds/Door Sound.mp3",
	"lamp":"res://ASS/sounds/Lamp Switch.mp3",
	"flip":"res://ASS/sounds/master_of_dreams_page_flipping_1_505.mp3"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func change_sound(id : String):
	stop()
	stream = load(sounds[id])
	play()
