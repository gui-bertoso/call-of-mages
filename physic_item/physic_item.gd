extends Area2D

@export var item: ItemData = null
var can_collect: bool = false

func _ready() -> void:
	if item == null: queue_free()
	if item:
		$Sprite2D.texture = item.item_image
		$Label.text = item.item_name
		$Label2.text = item.item_description

func _process(_delta: float) -> void:
	if can_collect:
		if Input.is_action_just_pressed("action_collect"):
			Globals.character.equip_book(item.book_scene)
			queue_free()

func _on_body_entered(_body: Node2D) -> void:
	can_collect = true
	$Label.show()
	$Label2.show()
func _on_body_exited(_body: Node2D) -> void:
	can_collect = false
	$Label.hide()
	$Label2.hide()
