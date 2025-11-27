extends Control
class_name MainMenu

func _on_play_button_up() -> void:
	get_tree().change_scene_to_file("res://saves_menu/saves_menu.tscn")
