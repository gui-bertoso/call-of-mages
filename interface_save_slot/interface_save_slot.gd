extends Button
class_name InterfaceSaveSlot

@export var save_slot_number: int = 0

func _on_button_up() -> void:
	var session_data = DataManagement.get_session_data(save_slot_number)
	if session_data == null:
		DataManagement.create_session_save(save_slot_number)
	get_tree().change_scene_to_file("res://maps/main_map/main_map.tscn")

func _ready() -> void:
	var session_data = DataManagement.get_session_data(save_slot_number)
	if session_data != null:
		$Control.hide()
		$SaveData.show()
