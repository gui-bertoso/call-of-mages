extends Node2D

var started = false
var complete = false

func set_end_pos(pos):
	$EndPos.global_position = pos

func trade():
	$AnimationPlayer.play("trade")

func go_to_end_pos():
	$Node2D.global_position.x = move_toward($Node2D.global_position.x, $EndPos.global_position.x, 1)
	$Node2D.global_position.y = move_toward($Node2D.global_position.y, $EndPos.global_position.y, 1)
	started = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "trade": $AnimationPlayer.play("finish_trade")
	
