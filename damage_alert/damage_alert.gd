extends Label

func _process(delta: float) -> void:
	global_position += Vector2(0, delta)


func _on_timer_timeout() -> void:
	queue_free()
