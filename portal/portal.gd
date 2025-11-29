extends Node2D
class_name Portal

func _ready() -> void:
	get_tree().get_first_node_in_group("CharacterCamera").set_camera_enabled(false)
	Globals.character.visible = false

func _on_animation_finished(_anim_name: StringName) -> void:
	Globals.character.visible = true
	get_tree().get_first_node_in_group("CharacterCamera").set_camera_enabled(true)
	Globals.character.global_position = global_position
	queue_free()
