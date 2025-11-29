extends Control
class_name SavesMenu

func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")

var new_save_difficulty: int = 1
var current_save_slot: InterfaceSaveSlot

func _on_easy_button_up() -> void:
	new_save_difficulty = 0
	$ColorRect2.hide()
	current_save_slot.create_save()
func _on_normal_button_up() -> void:
	new_save_difficulty = 1
	$ColorRect2.hide()
	current_save_slot.create_save()
func _on_hard_button_up() -> void:
	new_save_difficulty = 2
	$ColorRect2.hide()
	current_save_slot.create_save()
func _on_hardcore_button_up() -> void:
	new_save_difficulty = 3
	$ColorRect2.hide()
	current_save_slot.create_save()

func get_new_save_difficulty():
	return new_save_difficulty

func show_difficulty_selection():
	$ColorRect2.show()
