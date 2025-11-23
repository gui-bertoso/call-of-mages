extends CollisionShape2D

@export var enemys_quantity: int = 4
@export var enemys_list: Array = []

@export var spawn_by_trigger: bool = true

var spawned = false

func _ready() -> void:
	if spawn_by_trigger: return
	spawn()

func _process(_delta: float) -> void:
	if get_child_count() <= 2 and spawned:
		$Reward.show()

func spawn() -> void:
	for i in enemys_quantity:
		var a = enemys_list[randi_range(0, enemys_list.size()-1)].instantiate()
		a.global_position = Vector2(randf_range(-shape.size.x/2, shape.size.x/2), randf_range(-shape.size.y/2, shape.size.y/2))
		add_child(a)
	spawned = true

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if not spawn_by_trigger: return
	spawn()
