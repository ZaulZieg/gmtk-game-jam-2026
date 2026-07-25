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
		"It all begins that night.....",
		"the night when i got that job...",
		"I thought it'll be so easy....",
		"Never thought it'll be this hard.....",
		"............"
	]
var text2 : Array = [
	"This is my first job...",
	"My night at this place....",
	"as a security..",
	"of a morgue nonetheless....",
	"Nice pick of the first job me!.....",
	".......",
	"okay, let's see.....",
	"the manager said it's an easy job....",
	"just do the task they gave me....",
	"and then just stay in the security room for the rest of the night....",
	"pretty easy....",
	"but a weird note after....",
	"\"if you see something weird, just don't look at it, easy....\"",
	"easy, but ominous note.....",
	"........whatever then, let's just do the job",
	"he left the task list on the table....",
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
		Countdown.start_timer(5)

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
