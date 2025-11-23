extends CanvasLayer

signal all_teleports_off
signal all_teleports_on

func fade():
	$AnimationPlayer.play("fade_in")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_in":
		$AnimationPlayer.play("fade_out")
	if anim_name == "fade_out":
		await get_tree().create_timer(1).timeout
		get_tree().call_group("Teleports", "enable_teleport")
		print("enabled")
