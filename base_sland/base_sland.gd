extends Node2D
class_name Sland

var sland_type: String = ""
var sland_scale: float = 1.0

var sland_type_scales = {
	"Trial": [1.0, 1.5],
	"Treasure": [0.6, 0.8],
	"Store": [0.8, 1.1],
	"Savepoint": [0.7, 1.0],
}

func randomize_sland_type():
	var rng = randi_range(0, 9)
	if rng < 5:
		sland_type = "Trial"
	elif rng == 7:
		sland_type = "Treasure"
	elif rng == 8:
		sland_type = "Savepoint"
	else:
		sland_type = "Store"

func _ready() -> void:
	randomize_sland_type()
	set_sland()

func set_sland() -> void:
	match sland_type:
		"Trial":
			await get_tree().create_timer(0.5).timeout
			spawn_enemys()
		"Treasure":
			await get_tree().create_timer(0.5).timeout
			spawn_enemys()
		"Savepoint":
			await get_tree().create_timer(0.5).timeout
			spawn_enemys()
		"Store":
			await get_tree().create_timer(0.5).timeout
			spawn_enemys()

func spawn_enemys():
	for i in randi_range(2, 5):
		var a = load("res://enemys/ghost/ghost.tscn").instantiate()
		$Enemys.add_child(a)
