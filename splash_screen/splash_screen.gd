extends Control
class_name SplashScreen

func load_menu():
	get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")


func _on_animation_finished(_anim_name: StringName) -> void:
	load_menu()
