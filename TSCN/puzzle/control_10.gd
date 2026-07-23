extends Control

@onready var arrays : Array[Node]=[]

func _ready() -> void:
	arrays = get_children()
	
func pops_up():
	for ad in arrays:
		ad.visible = true
		await get_tree().create_timer(0.05).timeout
