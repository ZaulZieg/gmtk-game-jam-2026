extends Control

@onready var start: Button = %Start
@onready var quit: Button = %Quit
@onready var v_box_container: VBoxContainer = $CenterContainer/VBoxContainer
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

var tween : Tween
var buttons : Array[Button] = []

func _ready() -> void:
	start.button_up.connect(start_game)
	quit.button_up.connect(quit_game)
	await get_tree().create_timer(1.0).timeout
	audio.play()
func _process(delta: float) -> void:
	pass
func start_game() -> void:
	SceneTransition.change_scene("res://TSCN/maps/security_room.tscn")
func quit_game() -> void:
	get_tree().call_deferred("quit")

func fade_in():
	pass
