extends ColorRect

func set_quest(quest_name="", quest_description="", quest_texture=preload("res://books/book0.tscn")):
	$Label.text = quest_name
	$Label2.text = quest_description
	$TextureRect.texture = quest_texture

func _on_timer_timeout() -> void:
	queue_free()
