extends Node2D

func _process(_delta: float) -> void:
	var direction = get_global_mouse_position() - global_position
	if direction.x >= 0:
		rotation = direction.angle()
		$Marker2D.scale.y = 1
	else:
		rotation = deg_to_rad(-90)
		$Marker2D.scale.y = -1
	var target_angle = (get_global_mouse_position() - global_position).angle()
	rotation = target_angle

func shake_screen():
	$"../Camera2D/AnimationPlayer".play("shake")
