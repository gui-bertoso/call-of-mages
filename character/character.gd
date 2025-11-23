extends CharacterBody2D
class_name Character

var current_book

var current_exp: int = 0
var needed_exp: int = 0
var current_level: int = 0

var exp_per_level: Array[int] = [
	3,
	5,
	9,
	12,
	16,
	23,
	30,
	32,
	38,
	47,
	57,
	70,
	82,
	105
]

const SPEED = 120.0
var mana: float = 20
var max_mana: float = 20

var souls: int = 2

var time_not_shotting: float = 0.5

func animate():
	if velocity.length() != 0:
		$Sprite2D/AnimationPlayer.play("walk")
	else:
		$Sprite2D/AnimationPlayer.play("idle")

func _ready():
	Globals.character = self
	needed_exp = exp_per_level[current_level]
	get_tree().get_first_node_in_group("ManaBar").update_max_value(max_mana)
	get_tree().get_first_node_in_group("ManaBar").update_value(mana)
	get_tree().get_first_node_in_group("ExpBar").update_value(needed_exp)
	get_tree().get_first_node_in_group("ExpBar").update_value(current_exp)

func consume_souls(value):
	souls -= value
	get_tree().call_group("SoulsContainer", "populate_souls")
	QuestsManager.catch_quest_event("current_souls", souls)
	if souls <= 0:
		death()

func death():
	get_tree().change_scene_to_file("res://game_over_screen.tscn")

func add_exp(value):
	current_exp += value
	if value > needed_exp - current_exp:
		var leftover = value - (needed_exp - current_exp)
		add_exp(leftover)
	if current_exp >= needed_exp:
		current_level += 1
		current_exp = 0
		Globals.level_up_points += 1
		needed_exp = exp_per_level[current_level]
	get_tree().get_first_node_in_group("ExpBar").update_max_value(needed_exp)
	get_tree().get_first_node_in_group("ExpBar").update_value(current_exp)
	get_tree().get_first_node_in_group("HUD").level_upped()
	QuestsManager.catch_quest_event("current_level", current_level)

func has_mana(value: int):
	return mana >= value

func consume_mana(value):
	mana -= value
	time_not_shotting = 0.5
	get_tree().get_first_node_in_group("ManaBar").update_value(mana)

func equip_book(book_scene):
	for i in $Node2D/Marker2D.get_children():
		i.queue_free()
	current_book = book_scene.instantiate()
	$Node2D/Marker2D.add_child(current_book)

func _process(delta: float) -> void:
	animate()

func _physics_process(_delta: float) -> void:
	time_not_shotting -= _delta
	if time_not_shotting <= 0:
		if mana < max_mana:
			mana += _delta
			get_tree().get_first_node_in_group("ManaBar").update_value(mana)
			
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity = direction * (SPEED + Globals.extra_move_speed)
	else:
		velocity.x = move_toward(velocity.x, 0, (SPEED + Globals.extra_move_speed))
		velocity.y = move_toward(velocity.y, 0, (SPEED + Globals.extra_move_speed))
	
	if velocity.x < 0:
		$Sprite2D.flip_h = true
	if velocity.x > 0:
		$Sprite2D.flip_h = false

	move_and_slide()
