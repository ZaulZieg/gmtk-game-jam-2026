extends Control
@onready var control_10: Control = $CenterContainer/Panel/Control10

@onready var cofirmationbox: CenterContainer = $CenterContainer/Panel/cofirmationbox
@onready var Start_button: Button = $CenterContainer/Panel/Button
var tween : Tween
func _ready() -> void:
	Start_button.button_down.connect(start_pressed)
	Start_button.pressed.connect(animate_start)
	
func start_pressed():
	control_10.pops_up()
	cofirmationbox.visible = true
	
	
func animate_start():
	Start_button.offset_transform_enabled = true
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(Start_button,"offset_transform_scale", Vector2(1.1,1.1),0.05)
	tween.tween_property(Start_button,"offset_transform_scale", Vector2.ONE,0.05)
	tween.tween_callback(func():Start_button.disabled = true)
