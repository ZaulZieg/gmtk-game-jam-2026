extends Node2D
@onready var pause_menu: CanvasLayer = $"../Pause Menu"

var game_pause : bool = false

func _ready() -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event:
		if Input.is_action_just_pressed("ui_cancel"):
			if not game_pause:
				pause()
			else : 
				unpause()
func pause():
	game_pause = true
	get_tree().paused = true
	pause_menu.visible = true

func unpause():
	get_tree().paused = false
	game_pause = false
	pause_menu.visible = false
