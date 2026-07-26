extends Node2D
@onready var label: Label
@onready var player: Player = $Player
@onready var color_rect: ColorRect
@onready var dialogue: CanvasLayer = $opening/dialogue
@onready var gui: Control = $Player/GUI/Control

func _ready() -> void:
	if not Boolvariable.opening_dialog:
		gui.visible = false
		player.player_able_to_move = false
		spawn_dialogue()
		
		label.connect("play_animation1", play_opening)
		label.connect("text2_finished", continue_game)
	MusicManager.play_secure_music()
	if Global.complete_task == 15:
		Countdown.timer.stop()
		SceneTransition.change_scene("res://TSCN/Winning_screen.tscn")
	

func play_opening():
	print("play_animation1 received")
	
	var tween = create_tween()
	tween.tween_property(color_rect,"color:a",0,1.0)
	await tween.finished
	label.play_second()

func continue_game():
	player.player_able_to_move = true
	Boolvariable.opening_dialog = true
	dialogue.get_child(0).queue_free()

func spawn_dialogue():
	var scene = preload("res://TSCN/opening.tscn")
	var inst = scene.instantiate()
	dialogue.add_child(inst)
	if not label:
		label = dialogue.get_child(0).find_child("Label")
	else: print("Label Found")
	if not color_rect:
		color_rect = dialogue.get_child(0).find_child("ColorRect")
	else: print("ColorRect Found")
	
