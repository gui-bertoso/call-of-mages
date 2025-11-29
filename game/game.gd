extends Node2D

func _ready():
	spawn_sland()

func _process(delta: float) -> void:
	DataManagement.data_dictionary.played_time += delta

func spawn_sland():
	for i in $CurrentSland.get_children():
		i.queue_free()
	DataManagement.data_dictionary.current_sland += 1
	if DataManagement.data_dictionary.current_sland > 0:
		var new_sland: Sland = load("res://base_sland/base_sland.tscn").instantiate()
		$CurrentSland.add_child(new_sland)
	else:
		var new_sland: TutorialSland = load("res://tutorial_sland/tutorial_sland.tscn").instantiate()
		$CurrentSland.add_child(new_sland)

func _exit_tree() -> void:
	DataManagement.save_session_data()
