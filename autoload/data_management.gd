extends Node

var save_folder_path: String = "user://CallOfMages"

var current_session_number = 0

var data_dictionary: Dictionary = {
	"player_position": Vector2(0, 0),
	"player_level": 0,
	"player_experience": 0,
	"player_souls": 0,
	"player_mana": 0,
	"player_book": null,
	"player_itens": [],
	"player_move_speed": 0,
	"player_max_mana": 0,
	"player_level_up_points": 0,
	
	"save_progress_state": 0,
	"played_time": 0.0,
	"difficulty": 1,
	"first_run": true,
	
	"current_sland": -1
}

var settings_dictionary = {}

func _ready() -> void:
	if not DirAccess.dir_exists_absolute(save_folder_path): DirAccess.make_dir_absolute(save_folder_path)

func save_data():
	var file0 = FileAccess.open(save_folder_path + "/achievements.save", FileAccess.WRITE)
	file0.store_var(Achievements.quests_dictionary.duplicate())
	file0.close()
	
	var file1 = FileAccess.open(save_folder_path + "/config.save", FileAccess.WRITE)
	file1.store_var(settings_dictionary)
	file1.close()

func load_data():
	pass

func get_session_data(save_slot: int) -> Dictionary:
	current_session_number = save_slot
	if FileAccess.file_exists(DataManagement.save_folder_path + "/session" + str(save_slot) + ".save"):
		var file = FileAccess.open(DataManagement.save_folder_path + "/session" + str(save_slot) + ".save", FileAccess.READ)
		var data = file.get_var()
		print("GETED DATA:" + str(data))
		data_dictionary = data
		return data_dictionary
	return {}

func create_session_save(save_slot: int):
	current_session_number = save_slot
	var file = FileAccess.open(DataManagement.save_folder_path + "/session" + str(save_slot) + ".save", FileAccess.WRITE)
	file.store_var(data_dictionary)
	print("STORAD DATA:" + str(data_dictionary))
	file.close()

func save_session_data():
	var file = FileAccess.open(DataManagement.save_folder_path + "/session" + str(current_session_number) + ".save", FileAccess.WRITE)
	file.store_var(data_dictionary)
	print("STORAD DATA:" + str(data_dictionary))
	file.close()

func delete_session_save(save_slot: int):
	DirAccess.remove_absolute(DataManagement.save_folder_path + "/session" + str(save_slot) + ".save")

func _enter_tree() -> void:
	load_data()

func _exit_tree() -> void:
	save_data()
