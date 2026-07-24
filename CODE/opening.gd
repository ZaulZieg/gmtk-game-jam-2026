extends Label
signal continue_pressed
var texts1 : Array = [
		"It all begins that night.....",
		"the night when i got that job...",
		"I thought it'll be so easy....",
		"Never thought it'll be this hard....."
	]

func _ready() -> void:
	await show_dialogues()

func _process(delta: float) -> void:
	pass
	
	
func show_dialogues():
	for t in texts1:
		await type_text(t)
		await continue_pressed

func type_text(tex):
	text = tex
	visible_characters = 0
	while visible_characters < tex.length():
		visible_characters += 1
		await get_tree().create_timer(0.05).timeout

func _input(event: InputEvent) -> void:
	if event:
		if event.is_action_pressed("lefty"):
			continue_pressed.emit()
