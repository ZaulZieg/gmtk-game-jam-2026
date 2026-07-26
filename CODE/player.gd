extends CharacterBody2D
class_name Player

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

@export var SPEED : float = 200.0
@export var dir : Vector2 = Vector2.ZERO
@onready var flashlight : Node2D = $Node2D
@onready var point_ligh : PointLight2D = $Node2D/PointLight2D2
@onready var flash_switch : bool = false
@onready var look_dir : Vector2 = Vector2.ZERO
@onready var label: Sprite2D = $Node2D2/CanvasLayer/Label
@onready var player_able_to_move : bool = true
@onready var pause_layer: CanvasLayer = $CanvasLayer
@onready var progress_bar: ProgressBar = $GUI/Control/MarginContainer/HBoxContainer/ProgressBar
@onready var countdown : RichTextLabel = $GUI/Control/MarginContainer/HBoxContainer/RichTextLabel
@onready var gui: Control = $GUI/Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var ghost_count : int = 0

var room : String = ""

var ghost_in_hallway1 : bool = false
var ghost_in_hallway2 : bool = false
var ghost_in_flashlight : bool = false
var hallway_light_on : bool = true
var hallway2_light_on : bool = true

func _ready() -> void:
	Global.puzzle_up.connect(func():
		velocity = Vector2.ZERO
		)
	timer.timeout.connect(on_timer_timeout)
	
	Global.dialog_closed.connect(func(): gui.visible = true)
	
	point_ligh.enabled = Boolvariable.player_flashlisght
	$Node2D/PointLight2D.enabled = Boolvariable.player_flashlisght
	$Node2D/Area2D/CollisionPolygon2D.disabled = !Boolvariable.player_flashlisght
	
	Global.player_in_room = get_parent().name
	print(Global.player_in_room, " | ", Global.from_room)
	
	Boolvariable.change_update.connect(update_sanity_timer)
	Countdown.time_changed.connect(time_print)
func _physics_process(delta: float) -> void:
	if !player_able_to_move:
		return
		
	dir = Input.get_vector("left","right","up","down")
	
	if dir.x != 0:
		dir.y = 0
	elif dir.y != 0:
		dir.x = 0
	
	if dir:
		if dir == Vector2.DOWN:
			anim.play("walk_down")
		elif dir == Vector2.UP:
			anim.play("walk_up")
		elif dir == Vector2.LEFT:
			anim.flip_h = false
			anim.play("walk_left")
		elif dir == Vector2.RIGHT:
			anim.flip_h = true
			anim.play("walk_left")
		velocity = (dir * SPEED) * (delta * 100)
	else :
		velocity = velocity.move_toward(Vector2.ZERO, 50.0)
		anim.pause()
		
	if dir != Vector2.ZERO:
		look_dir = dir.normalized()
	
	flashlight.rotation = look_dir.angle()
	label.position = $Node2D2.global_position
	progress_bar.value = Global.sanity
	move_and_slide()

func _input(event: InputEvent) -> void:
	if not player_able_to_move:
		return
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				Sfx.change_sound("lamp")
				Boolvariable.player_flashlisght = !Boolvariable.player_flashlisght
				point_ligh.enabled = Boolvariable.player_flashlisght
				$Node2D/PointLight2D.enabled = Boolvariable.player_flashlisght
				$Node2D/Area2D/CollisionPolygon2D.disabled = !Boolvariable.player_flashlisght
				Boolvariable.update_sanity()
	elif event is InputEventKey:
		if Input.is_action_just_pressed("ui_cancel") and Global.able_to_pause:
			Sfx.change_sound("flip")
			Input.flush_buffered_events()
			Global.pause_game()
			pause_layer.visible = true

func update_sanity_timer(hurt : bool):
	if hurt:
		if timer.is_stopped():
			timer.start()
	else:
		timer.stop()
	
	
	#var should_reduce: bool = false
	#if ghost_in_flashlight:
		#should_reduce = true
	#if should_reduce:
		#if timer.is_stopped():
			#timer.start()
	#else:
		#timer.stop()
	print("ghost : ", hurt)

func on_timer_timeout():
	animation_player.play("shake")
	Global.sanity -= 5
func time_print(minutes, seconds) :
	countdown.text = "%02d:%02d" % [minutes,seconds]
