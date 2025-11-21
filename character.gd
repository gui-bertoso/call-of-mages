extends CharacterBody2D
class_name Character

var current_book

const SPEED = 120.0
var mana: float = 20
var max_mana: float = 20

var time_not_shotting: float = 0.5

func has_mana(value: int):
	return mana >= value

func consume_mana(value):
	mana -= value
	time_not_shotting = 0.5
	get_tree().get_first_node_in_group("ManaBar").update_value(mana)

func _ready():
	Globals.character = self
	get_tree().get_first_node_in_group("ManaBar").update_value(mana)

func equip_book(book_scene):
	for i in $Node2D/Marker2D.get_children():
		i.queue_free()
	current_book = book_scene.instantiate()
	$Node2D/Marker2D.add_child(current_book)

func _physics_process(_delta: float) -> void:
	time_not_shotting -= _delta
	if time_not_shotting <= 0:
		if mana < max_mana:
			mana += _delta
			get_tree().get_first_node_in_group("ManaBar").update_value(mana)
			
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if velocity.x < 0:
		$Sprite2D.flip_h = true
	if velocity.x > 0:
		$Sprite2D.flip_h = false

	move_and_slide()
