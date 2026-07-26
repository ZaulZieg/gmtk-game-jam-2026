extends Control

signal puzzle_done

@onready var switch_1: CheckButton = $CenterContainer/Panel/VBoxContainer/switch1
@onready var switch_2: CheckButton = $CenterContainer/Panel/VBoxContainer/switch2
@onready var switch_3: CheckButton = $CenterContainer/Panel/VBoxContainer/switch3
@onready var switch_4: CheckButton = $CenterContainer/Panel/VBoxContainer/switch4

var all_switch := []

func _ready() -> void:
	switch_3.button_down.connect(switch3_on)
	switch_1.button_down.connect(switch1_on)
	switch_4.button_down.connect(switch4_on)
	all_switch = [switch_1,switch_2,switch_3,switch_4]
	
func _process(delta: float) -> void:
	if switch_2.pressed:
		if all_switch.all(func(sw): return sw.button_pressed):
			$Label.text = "all switch are on"
			Global.puzzle_done.emit()

func switch3_on():
	if switch_1.button_pressed:
		switch_1.button_pressed = false
func switch1_on():
	if switch_2.button_pressed:
		switch_2.button_pressed = false
	if switch_4.button_pressed:
		switch_4.button_pressed = false
func switch4_on():
	if switch_2.button_pressed:
		switch_2.button_pressed = false
