extends Area2D

@export var node = null

func _on_body_entered(_body: Node2D) -> void:
	$"../Control".show()

func _on_body_exited(body: Node2D) -> void:
	$"../Control".hide()
