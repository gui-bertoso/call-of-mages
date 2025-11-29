extends Area2D

@export var node: Node = null
@export var node2: Node = null
@export var node3: Node = null
@export var node4: Node = null

func _on_body_entered(_body: Node2D) -> void:
	node.show()
	if node2:
		node2.show()
	if node3:
		node3.show()
	if node4:
		node4.show()

func _on_body_exited(_body: Node2D) -> void:
	node.hide()
	if node2:
		node2.hide()
	if node3:
		node3.hide()
	if node4:
		node4.hide()
