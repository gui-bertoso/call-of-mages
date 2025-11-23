extends Area2D

@export var book: BookData = null
var can_collect: bool = false

func _ready() -> void:
	if book == null: queue_free()
	if book:
		$Sprite2D.texture = book.book_image
		$Label.text = book.book_name
		$Label2.text = book.book_description

func _process(_delta: float) -> void:
	if can_collect:
		if Input.is_action_just_pressed("action_collect"):
			Globals.character.equip_book(book.book_scene)
			queue_free()

func _on_body_entered(_body: Node2D) -> void:
	can_collect = true
	$Label.show()
	$Label2.show()
func _on_body_exited(_body: Node2D) -> void:
	can_collect = false
	$Label.hide()
	$Label2.hide()
