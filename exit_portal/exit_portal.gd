extends Node2D
class_name ExitPortal

func _on_body_entered(_body: Node2D) -> void:
	get_tree().get_first_node_in_group("GameCore").spawn_sland()
