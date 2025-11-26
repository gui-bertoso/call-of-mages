extends Projectile

var direction_variation = 0
var direction_variation_multiplier = 1.0

func _ready() -> void:
	direction_variation = randf_range(-0.3, 0.3)
	$Area2D.damage = damage

func _process(delta: float) -> void:
	direction_variation_multiplier += delta
	if $RayCast2D.is_colliding():
		$GPUParticles2D.emitting = true
		print("emiting")
		await get_tree().create_timer(0.14).timeout
		print("deleting")
		queue_free()
	else:
		position += (speed * Vector2(1, direction_variation * direction_variation_multiplier) * delta).rotated(rotation)
