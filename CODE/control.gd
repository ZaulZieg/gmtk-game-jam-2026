extends Control
@onready var resume: Button = $CenterContainer/VBoxContainer/Resume
@onready var restart: Button = $CenterContainer/VBoxContainer/Restart
@onready var quitb: Button = $CenterContainer/VBoxContainer/Quit


func _ready() -> void:
	resume.button_up.connect(resume_game)
	restart.button_up.connect(restart_game)
	quitb.button_up.connect(quit_game)

func resume_game() -> void :
	get_tree().paused = false
	Global.pause_game = false
	get_parent().visible = false
	
func restart_game() -> void:
	get_tree().paused = false
	Global.pause_game = false
	get_parent().visible = false
	get_tree().call_deferred("reload_current_scene")
	
func quit_game() -> void:
	get_tree().quit()
