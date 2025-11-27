extends Book

func _process(_delta: float) -> void:
	cooldown -= _delta
	if cooldown > 0: return
	if Input.is_action_just_pressed("action_fire") and Globals.character.has_mana(mana_consume):
		$GPUParticles2D.emitting = true
		cooldown = shot_cooldown
		
		var a = projectile.instantiate()
		a.position = $RayCast2D.global_position
		a.rotation = $RayCast2D.global_rotation
		get_parent().get_parent().shake_screen()
		Globals.character.consume_mana(1)
		get_tree().current_scene.add_child(a)
		
		var second_projectile = load("res://projectiles/shot8.tscn")
		
		var a2 = second_projectile.instantiate()
		a2.speed = a.speed
		a2.position = $RayCast2D2.global_position
		a2.rotation = $RayCast2D2.global_rotation
		get_tree().current_scene.add_child(a2)
		
		var a3 = second_projectile.instantiate()
		a3.speed = a.speed
		a3.position = $RayCast2D3.global_position
		a3.rotation = $RayCast2D3.global_rotation
		get_tree().current_scene.add_child(a3)
