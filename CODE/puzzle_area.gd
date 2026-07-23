extends CanvasLayer


func _ready() -> void:
	print("READY!!")
	Global.puzzle_pc1.connect(spawn_puzzle_pc1)
	Global.puzzle_switch1.connect(spawn_puzzle_switch1)
	Global.puzzle_up.connect(func(): 
		visible = true
		)
	Global.puzzle_down.connect(func(): 
		visible = false
		for child in get_children():
			child.call_deferred("queue_free")
		)
	
func spawn_puzzle_pc1():
	print("PC SIGNAL RECEIVED")
	var puzzle = preload("res://TSCN/puzzle/control.tscn")
	var inst_puzzle = puzzle.instantiate()
	inst_puzzle.puzzle_done.connect(func():
		print("puzzle done task finished")
		Global.puzzle_down.emit()
		Global.inside_a_puzzle = false
		print("is inside a puzzle : ", Global.inside_a_puzzle)
		)
	add_child(inst_puzzle)
	
func spawn_puzzle_switch1():
	print("SWITCH SIGNAL RECEIVED")
	var puzzle = preload("res://TSCN/puzzle/switch_seq.tscn")
	var inst_puzzle = puzzle.instantiate()
	inst_puzzle.puzzle_done.connect(func():
		print("puzzle done task finished")
		Global.puzzle_down.emit()
		Global.inside_a_puzzle = false
		print("is inside a puzzle : ", Global.inside_a_puzzle)
		)
	add_child(inst_puzzle)



func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if Input.is_action_just_pressed("ui_cancel"):
			Global.unpause_game()
			Global.inside_a_puzzle = false
