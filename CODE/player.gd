extends CharacterBody2D


@export var SPEED : float = 500.0
@export var dir : Vector2 = Vector2.ZERO
@onready var flashlight : Node2D = $Node2D
@onready var point_ligh : PointLight2D = $Node2D/PointLight2D2
@onready var flash_switch : bool = false
@onready var look_dir : Vector2 = Vector2.ZERO
@onready var label: Label = $Node2D2/CanvasLayer/Label
func _ready() -> void:
	Global.puzzle_up.connect(func():
		velocity = Vector2.ZERO
		)
	
func _physics_process(delta: float) -> void:
	
	dir = Input.get_vector("left","right","up","down")
	
	if dir.x != 0:
		dir.y = 0
	elif dir.y != 0:
		dir.x = 0
	
	if dir:
		velocity = velocity.move_toward((dir * SPEED) , 20.0)
	else :
		velocity = velocity.move_toward(Vector2.ZERO, 20.0)
		
	if dir != Vector2.ZERO:
		look_dir = dir.normalized()
	
	flashlight.rotation = look_dir.angle()
	label.position = $Node2D2.global_position
		
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				flash_switch = !flash_switch
				point_ligh.enabled = flash_switch
