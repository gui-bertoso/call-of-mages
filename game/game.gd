extends Node2D


func _ready():
	spawn_sland()

func _process(delta: float) -> void:
	DataManagement.data_dictionary.played_time += delta

func spawn_sland():
	for i in $CurrentSland.get_children():
		i.queue_free()
	
	var new_sland: Sland = load("res://base_sland/base_sland.tscn").instantiate()
	$CurrentSland.add_child(new_sland)
