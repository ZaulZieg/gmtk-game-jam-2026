extends Control
@onready var resume: Button = $CenterContainer/VBoxContainer/Resume
@onready var quitb: Button = $CenterContainer/VBoxContainer/Quit


func _ready() -> void:
	resume.button_up.connect(resume_game)
	quitb.button_up.connect(quit_game)

func resume_game() -> void :
	Global.unpause_game()
	get_parent().visible = false
	
func quit_game() -> void:
	get_tree().quit()
