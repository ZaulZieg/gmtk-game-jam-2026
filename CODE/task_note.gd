extends CanvasLayer


func _input(event: InputEvent) -> void:
	if event and get_tree().paused:
		if Input.is_action_just_pressed("ui_cancel"):
			Global.unpause_game()
			call_deferred("queue_free")
