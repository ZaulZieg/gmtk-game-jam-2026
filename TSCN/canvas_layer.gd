extends CanvasLayer

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	visible = Global.interactable_arr.size() > 0
