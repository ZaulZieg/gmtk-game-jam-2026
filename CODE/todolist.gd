extends Control

@onready var timer: Timer = $Timer
@onready var label: RichTextLabel = $HBoxContainer/RichTextLabel
@onready var todo_list : Array = []
@onready var lists : Array = []

var complete_task : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	timer.timeout.connect(refresh)
	lists = [
		"Hallway light 1",
		"Hallway light 2",
		"Hallway 2 light 1",
		"Hallway 2 light 2",
		"Document Room Light",
		"Document Room Computer 1",
		"Document Room Computer 2",
		"Document Room Computer 3",
		"Coffin Room Light",
		"Male Toilet Light",
		"Female Toilet Light",
		"Cremation Room Light",
		"Autopsy Room Light",
		"Front Office Light",
		"Front Office Computer"
	]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func refresh():
	complete_task = 0
	label.text = ''
	todo_list = [
		Boolvariable.hallway1_light_left,
		Boolvariable.hallway1_light_right,
		Boolvariable.hallway2_light_left,
		Boolvariable.hallway2_light_right,
		Boolvariable.doc_room_light,
		Boolvariable.doc_room_pc1,
		Boolvariable.doc_room_pc2,
		Boolvariable.doc_room_pc2,
		Boolvariable.cof_room_light,
		Boolvariable.male_toilet_light,
		Boolvariable.female_toilet_light,
		Boolvariable.cre_light,
		Boolvariable.aut_light,
		Boolvariable.fo_light,
		Boolvariable.fo_pc
	]
	for i in todo_list.size():
		
		if todo_list[i]:
			label.append_text(lists[i] + "\n")
		else:
			label.append_text("[s] %s [/s]\n" %lists[i])
			complete_task += 1
	Global.complete_task = complete_task
