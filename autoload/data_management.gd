extends Node

var save_folder_path: String = "user://CallOfMages"

var data_dictionary = {
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
	"time_played": 0,
	"difficulty": 1,
	"first_run": true
}

var settings_dictionary = {}

func _ready() -> void:
	if not DirAccess.dir_exists_absolute(save_folder_path): DirAccess.make_dir_absolute(save_folder_path)

func save_data():
	var file0 = FileAccess.open(save_folder_path + "/achievements.save", FileAccess.WRITE)
	file0.store_var(Achievements.quests_dictionary.duplicate())
	file0.close()
	
	var file1 = FileAccess.open(save_folder_path + "/config.save", FileAccess.WRITE)
	file1.store_var(data_dictionary)
	file1.close()

func load_data():
	pass

func get_session_data(save_slot: int):
	if FileAccess.file_exists(DataManagement.save_folder_path + "/session" + str(save_slot) + ".save"):
		var file = FileAccess.open(DataManagement.save_folder_path + "/session" + str(save_slot) + ".save", FileAccess.READ)
		var data = file.get_var()
		return data
	return null

func create_session_save(save_slot: int):
	var file = FileAccess.open(DataManagement.save_folder_path + "/session" + str(save_slot) + ".save", FileAccess.WRITE)
	file.store_var(data_dictionary)
	file.close()
