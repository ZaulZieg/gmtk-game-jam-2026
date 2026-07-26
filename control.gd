extends Control
@onready var label: Label = $Margin/Control/ColorRect/MarginContainer/Label
@onready var margin: MarginContainer = $Margin
var typing := false
signal continue_pressed
var textss = [
	"fuhh...I've made it.....",
	"I should really start looking for another job....."
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await show_dialogues(textss)

func show_dialogues(which):
	for t in which:
		await type_text(t)
		await continue_pressed
	close_dialogue()
	
func type_text(tex):
	typing =  true
	label.text = tex
	label.visible_characters = 0
	while label.visible_characters < tex.length():
		if !typing:
			break
		label.visible_characters += 1
		await get_tree().create_timer(0.05).timeout
	label.visible_characters = tex.length()
	typing = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if event:
		if event.is_action_pressed("lefty"):
			if typing:
				typing = false
			else :
				continue_pressed.emit()

func close_dialogue():
	var tween = create_tween()
	tween.tween_property(margin,"offset_transform_position_ratio:y",1.0, 0.5)
	await tween.finished
	SceneTransition.change_scene("res://TSCN/creaditscreen.tscn")
