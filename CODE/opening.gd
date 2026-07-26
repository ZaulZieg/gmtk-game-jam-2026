extends Label
signal continue_pressed
signal play_animation1
signal text2_finished
@onready var control: Control = $"../../../../.."
@onready var texture_rect: TextureRect = $"../TextureRect"
var count : int = 0 :
	set(value):
		if value > 4: value = 0
		count = value
var texts1 : Array = [
		"I hate being in the dark..",
		"Yet somehow i managed to get myself a job as a night guard....",
		".........."
	]
var text2 : Array = [
	"I heard that this place is scary at night but i never imagine it would be this scary..",
	"Im all alone with nothing but a flashlight and that damn to do list",
	"they said this job is supposed to be easy...",
	"all i gotta do is turn off any source of light in other room",
	"but they didn't mention about those things that would drive me insane if i keep looking at them",
	".......",
	"on top of that i need to finish before midnight or they will swarm me and drive me insane",
	"why can't people before me do these stuff",
	"well...it's almost midnight...",
	"better get to it",
	".............."
]
var picss : Array[String] = [
	"res://ASS/Sprites/Character Sprites/face 1.PNG",
	"res://ASS/Sprites/Character Sprites/face 2.PNG",
	"res://ASS/Sprites/Character Sprites/face 3.PNG",
	"res://ASS/Sprites/Character Sprites/face 4.PNG",
	"res://ASS/Sprites/Character Sprites/face 5.PNG"
	]

var typing : bool = false
func _ready() -> void:
	await show_dialogues(texts1)
func play_text1():
	pass
func _process(delta: float) -> void:
	pass
	
func play_second():
	show_dialogues(text2)
func show_dialogues(which):
	
	count = 0
			
	if which == text2:
		texture_rect.visible = true
		
	for t in which:
		await type_text(t)
		await continue_pressed
		var randcount = randi_range(1,4)
		texture_rect.texture = load(picss[randcount])
	if which == texts1:
		play_animation1.emit()
	elif which == text2:
		close_dialogue()
		Countdown.start_timer(3.5)

func type_text(tex):
	typing =  true
	text = tex
	visible_characters = 0
	while visible_characters < tex.length():
		if !typing:
			break
		visible_characters += 1
		await get_tree().create_timer(0.05).timeout
	visible_characters = tex.length()
	typing = false

func close_dialogue():
	var tween = create_tween()
	tween.tween_property(control,"offset_transform_position_ratio:y",0.5, 0.5)
	await tween.finished
	control.hide()
	text2_finished.emit()
	Global.dialog_closed.emit()
	
	

func _input(event: InputEvent) -> void:
	if event:
		if event.is_action_pressed("lefty"):
			if typing:
				typing = false
			else :
				continue_pressed.emit()
