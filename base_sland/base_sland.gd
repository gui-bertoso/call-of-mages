extends Node2D
class_name Sland

var sland_type: String = ""
var sland_scale: float = 1.0

var exit_portal: ExitPortal = null

var sland_type_scales = {
	"Trial": [1.0, 1.5],
	"Treasure": [0.6, 0.8],
	"Store": [0.8, 1.1],
	"Savepoint": [0.7, 1.0],
}

var enemys_spawneds: bool = false

func randomize_sland_type():
	var rng = randi_range(0, 9)
	if rng <= 6:
		sland_type = "Trial"
	elif rng == 7:
		sland_type = "Treasure"
	elif rng == 8:
		sland_type = "Savepoint"
	else:
		sland_type = "Store"

func _ready() -> void:
	spawn_exit_portal()
	randomize_sland_type()
	set_sland()

func _process(delta: float) -> void:
	DataManagement.data_dictionary.played_time += delta
	
	if sland_type == "Trial":
		if enemys_spawneds:
			if $Enemys.get_child_count() == 0:
				sland_complete()

func set_sland() -> void:
	match sland_type:
		"Trial":
			set_sland_scale()
			await get_tree().create_timer(1.5).timeout
			spawn_enemys()
			enemys_spawneds = true
		"Treasure":
			spawn_treasure()
			sland_complete()
		"Savepoint":
			spawn_campfire()
			sland_complete()
		"Store":
			spawn_store()
			sland_complete()
	spawn_entry_portal()
	clear_markers()
	set_sland_scale()

func spawn_campfire():
	var campfire_marker: Marker2D = $Markers/CampfireMarkers.get_child(randi_range(0, $Markers/CampfireMarkers.get_child_count()-1))
	var new_campfire: Campfire = load("res://campfire/campfire.tscn").instantiate()
	new_campfire.global_position = campfire_marker.global_position
	$Structures.add_child(new_campfire)
	global_position = new_campfire.global_position

func spawn_treasure():
	var treasure_marker: Marker2D = $Markers/TreasureMarkes.get_child(randi_range(0, $Markers/TreasureMarkes.get_child_count()-1))
	var new_treasure: Treasure = load("res://treasure/treasure.tscn").instantiate()
	new_treasure.global_position = treasure_marker.global_position
	$Structures.add_child(new_treasure)
	global_position = new_treasure.global_position

func spawn_store():
	var store_marker: Marker2D = $Markers/StoreMarkers.get_child(randi_range(0, $Markers/StoreMarkers.get_child_count()-1))
	var new_store: Store = load("res://store/store.tscn").instantiate()
	new_store.global_position = store_marker.global_position
	$Structures.add_child(store_marker)
	global_position = store_marker.global_position
	
func spawn_entry_portal():
	var portal_marker: Marker2D = $Markers/EntryMarkers.get_child(randi_range(0, $Markers/EntryMarkers.get_child_count()-1))
	var new_portal: Portal = load("res://portal/portal.tscn").instantiate()
	new_portal.global_position = portal_marker.global_position
	add_child(new_portal)
	global_position = portal_marker.global_position
	
func spawn_exit_portal():
	var portal_marker: Marker2D = $Markers/ExitMarkers.get_child(randi_range(0, $Markers/ExitMarkers.get_child_count()-1))
	var new_portal: ExitPortal = load("res://exit_portal/exit_portal.tscn").instantiate()
	new_portal.global_position = portal_marker.global_position
	add_child(new_portal)
	global_position = portal_marker.global_position
	exit_portal = new_portal
	exit_portal.hide()

func spawn_enemys():
	for i in randi_range(1, 3):
		var spawn_area: CollisionShape2D = $Markers/EnemysSpawnLocations.get_child(randi_range(0, $Markers/EnemysSpawnLocations.get_child_count()-1))
		for i2 in randi_range(2, 4):
			var new_enemy: Enemy = load("res://enemys/ghost/ghost.tscn").instantiate()
			new_enemy.global_position = spawn_area.global_position + Vector2(
				randf_range(-spawn_area.shape.size.x/2, spawn_area.shape.size.x/2),
				randf_range(-spawn_area.shape.size.y/2, spawn_area.shape.size.y/2)
			)
			$Enemys.add_child(new_enemy)

func clear_markers():
	$Markers.queue_free()

func set_sland_scale():
	sland_scale = randf_range(sland_type_scales[sland_type][0], sland_type_scales[sland_type][1])
	$Scenario.scale = Vector2(sland_scale, sland_scale)

func sland_complete():
	exit_portal.show()
