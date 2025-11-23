extends Node2D
class_name Teleport

@export var other_teleport: Teleport = null

func disable_teleport():
	$Area2D.monitoring = false
	$Sprite2D.hide()

func enable_teleport():
	$Area2D.monitoring = true
	$Sprite2D.show()

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().call_group("Teleports", "disable_teleport")
	FadeScreen.fade()
	await get_tree().create_timer(0.4).timeout
	body.global_position = other_teleport.global_position
