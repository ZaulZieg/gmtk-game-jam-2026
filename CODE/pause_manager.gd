extends Node2D
@onready var pause_menu: CanvasLayer = $"../Pause Menu"


func _ready() -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event:
		if Input.is_action_just_pressed("ui_cancel"):
			if not Global.pause_game:
				pause()
			else : 
				unpause()
func pause():
	Global.pause_game()
	get_tree().paused = true
	pause_menu.visible = true

func unpause():
	get_tree().paused = false
	Global.unpause_game()
	pause_menu.visible = false
