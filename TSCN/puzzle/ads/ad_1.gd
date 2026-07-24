extends Control
@onready var button: Button = $VBoxContainer/HBoxContainer/Button


func _ready() -> void:
	button.button_up.connect(close_ad)
	
func close_ad():
	call_deferred("queue_free")
