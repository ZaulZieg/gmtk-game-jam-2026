extends Node

signal time_changed(minutes, seconds)
signal times_up

@onready var timer = Timer.new()

var time_left := 210

func _ready() -> void:
	add_child(timer)
	timer.wait_time = 1.0
	timer.timeout.connect(_on_timeout)

func start_timer(minutes):
	time_left = minutes * 60
	timer.start()
	
func _on_timeout():
	time_left-= 1
	if time_left < 1:
		timer.stop()
		SceneTransition.change_scene("res://TSCN/GameOverScreen.tscn")
	
	time_changed.emit(
		time_left / 60,
		time_left % 60
	)
	
	if time_left <= 0:
		timer.stop()
		times_up.emit()
