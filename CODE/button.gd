extends Button

var tween : Tween

func _ready() -> void:
	mouse_entered.connect(on_hover)
	mouse_exited.connect(on_leave)
	focus_entered.connect(on_hover)
	focus_exited.connect(on_leave)

func on_hover():
	if tween :
		tween.kill()
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "offset_transform_scale", Vector2(1.3, 1.3), 0.5)
	
func on_leave():
	if tween :
		tween.kill()
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "offset_transform_scale", Vector2.ONE, 0.5)
