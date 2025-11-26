extends Projectile

var enemy = null

var chase_start_cooldown = 0.2

func _ready() -> void:
	$Area2D.damage = damage

func _process(delta: float) -> void:
	if $RayCast2D.is_colliding():
		$GPUParticles2D.emitting = true
		await get_tree().create_timer(0.14).timeout
		queue_free()
	else:
		chase_start_cooldown -= delta
		if enemy == null or chase_start_cooldown > 0:
			position += (speed * Vector2(1, 0) * delta).rotated(rotation)
		else:
			position += (Vector2(position-enemy.global_position).normalized() * -speed * delta)

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	enemy = body


func _on_area_2d_2_body_exited(_body: Node2D) -> void:
	enemy = null
