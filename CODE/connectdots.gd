extends Control
@onready var switch_1: CheckButton = $CenterContainer/Panel/VBoxContainer/switch1
@onready var switch_2: CheckButton = $CenterContainer/Panel/VBoxContainer/switch2
@onready var switch_3: CheckButton = $CenterContainer/Panel/VBoxContainer/switch3
@onready var switch_4: CheckButton = $CenterContainer/Panel/VBoxContainer/switch4

func _ready() -> void:
	switch_3.button_down.connect(switch3_on)
	
func _process(delta: float) -> void:
	pass

func switch3_on():
	if switch_1.button_pressed:
		switch_1.button_pressed = false
