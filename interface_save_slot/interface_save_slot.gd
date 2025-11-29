extends Button
class_name InterfaceSaveSlot

@export var save_slot_number: int = 0
@export var control: SavesMenu

func _on_button_up() -> void:
	var session_data = DataManagement.get_session_data(save_slot_number)
	if session_data == {}:
		control.current_save_slot = self
		control.show_difficulty_selection()
	else:
		get_tree().change_scene_to_file("res://game/game.tscn")

func create_save():
	DataManagement.data_dictionary.difficulty = control.get_new_save_difficulty()
	DataManagement.create_session_save(save_slot_number)
	get_tree().change_scene_to_file("res://game/game.tscn")

func _ready() -> void:
	var session_data = DataManagement.get_session_data(save_slot_number)
	if session_data != {}:
		$Control.hide()
		$SaveData.show()
		
		$SaveData/VBoxContainer/HBoxContainer/Label3.text = str(int(session_data.played_time/3600)).pad_zeros(2) + ":" + str((int(session_data.played_time)%3600)/60).pad_zeros(2)
		$SaveData/VBoxContainer/HBoxContainer2/Label3.text = str(session_data.player_level)
		
		var difficulty_text = ""
		match session_data.difficulty:
			0:
				difficulty_text = "Easy"
			1:
				difficulty_text = "Normal"
			2:
				difficulty_text = "Hard"
			3:
				difficulty_text = "Hardcore"
		$SaveData/VBoxContainer/HBoxContainer3/Label3.text = difficulty_text

func _on_mouse_entered() -> void:
	$SaveData/TextureRect/ColorRect.show()
	$SaveData/TextureRect/ColorRect2.show()

func _on_mouse_exited() -> void:
	$SaveData/TextureRect/ColorRect.hide()
	$SaveData/TextureRect/ColorRect2.hide()

func _on_delete_button_up() -> void:
	DataManagement.delete_session_save(save_slot_number)
	$Control.show()
	$SaveData.hide()
	
