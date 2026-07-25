extends Control

@onready var start: Button = %Start
@onready var quit: Button = %Quit
@onready var v_box_container: VBoxContainer = $CenterContainer/VBoxContainer
@onready var label: Label = $CenterContainer/VBoxContainer/Label

var tween : Tween
var buttons : Array[Button] = []

func _ready() -> void:
	label.offset_transform_enabled = true
	animate()
	start.button_up.connect(start_game)
	quit.button_up.connect(quit_game)

func animate() -> void:
	tween = create_tween()
	tween.set_loops()
	tween.tween_property(label, "offset_transform_position_ratio:y", -0.05, 1.0)
	tween.tween_property(label, "offset_transform_position_ratio:y", 0.0, 1.0)
	
func start_game() -> void:
	SceneTransition.change_scene("res://TSCN/maps/security_room.tscn")
func quit_game() -> void:
	get_tree().call_deferred("quit")
